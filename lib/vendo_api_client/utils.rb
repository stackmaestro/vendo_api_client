# frozen_string_literal: true

require "vendo_api_client/request"

module VendoApiClient
  module Utils

    def get(path, options = {}, headers = {})
      request(:get, path, options, headers)
    end

    def post(path, options = {}, _headers = {})
      request(:post, path, options)
    end

    def patch(path, options = {}, _headers = {})
      request(:patch, path, options)
    end

    def delete(path, options = {}, _headers = {})
      equest(:delete, path, options)
    end

    def request(request_method, path, options = {}, headers = {})
      VendoApiClient::Request.new(self, request_method, path, options, headers).perform
    end
  end
end
