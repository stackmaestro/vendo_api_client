# frozen_string_literal: true

require "vendo_api_client/auth"
require "vendo_api_client/cart"
require "vendo_api_client/line_item"
require "vendo_api_client/coupon"

module VendoApiClient
  module API
    include VendoApiClient::Auth
    include VendoApiClient::Cart
    include VendoApiClient::LineItem
    include VendoApiClient::Coupon
  end
end
