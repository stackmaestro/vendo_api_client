# frozen_string_literal: true

require "vendo_api_client/utils"

module VendoApiClient
  module Cart
    include VendoApiClient::Utils

    def create_cart
      response = post("api/v2/storefront/cart", {}, accept_content_headers)
      @current_cart = response[:data][:attributes][:token]
      response
    end

    def retrieve_cart(include_line_items = false)
      headers = accept_content_headers.merge({ "X-Vendo-Order-Token": current_cart })
      option = {}
      option = { params: { include: "line_items" } } if include_line_items
      get("api/v2/storefront/cart", option, headers)
    end
  end
end
