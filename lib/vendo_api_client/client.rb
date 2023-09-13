# frozen_string_literal: true

require "vendo_api_client/api"

module VendoApiClient
  class Client
    include VendoApiClient::API

    attr_accessor :bearer_token, :refresh_token, :current_cart

    # @return [Boolean]
    def bearer_token?
      !!bearer_token
    end

    def accept_content_headers
      {
        "Accept": "application/vnd.api+json",
        "Content-Type": "application/vnd.api+json"
      }
    end
  end
end
