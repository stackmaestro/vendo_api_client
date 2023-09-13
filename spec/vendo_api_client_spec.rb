# frozen_string_literal: true
require 'pry'
RSpec.describe VendoApiClient do
  it "has a version number" do
    expect(VendoApiClient::VERSION).not_to be nil
  end

  it "does something useful" do
    binding.pry
  end
end
