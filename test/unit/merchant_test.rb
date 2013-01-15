require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  
  test "new merchant with no values is invalid" do
    merchant = Merchant.new
    assert !merchant.save
  end

  test "new merchant with name but no address is invalid" do
    merchant = Merchant.new(full_name: "Tom's Awesome Shop")
    assert !merchant.save
  end

  test "new merchant with address but no name is unvalid" do
    merchant = Merchant.new(address: "456 Unreal Rd")
    assert !merchant.save
  end

  test "new merchant with name and address is valid" do
    merchant = Merchant.new(full_name: "Tom's Awesome Shop", address: "456 Unreal Rd")
    assert merchant.save
  end
end