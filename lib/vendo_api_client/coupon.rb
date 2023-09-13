# frozen_string_literal: true

require "vendo_api_client/utils"

module VendoApiClient
  module Coupon
    include VendoApiClient::Utils

    def apply_coupon_code(coupon_code:)
      headers = accept_content_headers.merge({ "X-Vendo-Order-Token": current_cart })
      options = { body: { coupon_code: coupon_code } }
      patch("api/v2/storefront/cart/apply_coupon_code", options, headers)
    end
  end
end
