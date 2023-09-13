# frozen_string_literal: true

require "faraday"
require "vendo_api_client/error"

module VendoApiClient
  class Request
    BASE_URL = "https://demo.getvendo.com"
    attr_accessor :auth_headers, :options, :request_path, :request_method

    def initialize(client, request_method, request_path,  options = {}, auth_headers = {})
      @client = client
      @request_method = request_method
      @request_path = request_path
      @auth_headers = auth_headers || {}
      @options = options || {}
      @conn = Faraday.new(BASE_URL) do |f|
        f.request :json # encode req bodies as JSON and automatically set the Content-Type header
        f.response :json # decode response bodies as JSON
      end
    end

    def perform
      response = @conn.send(@request_method.to_s, @request_path) do |req|
        req.params = options[:params] || {}
        req.body = options[:body] || {}
        req.headers = @auth_headers
      end

      response_body = response.body.empty? ? "" : symbolize_keys!(response.body)
      response_headers = response.headers
      fail_or_return_response_body(response.status, response_body, response_headers)
    end

    def fail_or_return_response_body(code, body, headers)
      error = error(code, body, headers)
      raise(error) if error

      body
    end

    def error(code, body, headers)
      klass = VendoApiClient::Error::ERRORS[code]
      if !klass.nil?
        klass.from_response(body, headers)
      elsif body&.is_a?(Hash) && (err = body.dig(:processing_info, :error))
        VendoApiClient::Error.from_processing_response(err, headers)
      end
    end

    private

    def symbolize_keys!(object)
      if object.is_a?(Array)
        object.each_with_index do |val, index|
          object[index] = symbolize_keys!(val)
        end
      elsif object.is_a?(Hash)
        object.dup.each_key do |key|
          object[key.to_sym] = symbolize_keys!(object.delete(key))
        end
      end
      object
    end
  end
end
