require 'test_helper'

class VoucherTest < ActiveSupport::TestCase

  test "new voucher with no values is invalid" do
    voucher = Voucher.new
    assert !voucher.save
  end

  test "new voucher with description but no price is invalid" do
    voucher = Voucher.new(description: "$30 of awesome for $10")
    assert !voucher.save
  end

  test "new voucher with price but no description is invalid" do
    voucher = Voucher.new(price: 10.0)
    assert !voucher.save
  end

  test "new voucher with price and description is invalid" do
    voucher = Voucher.new(description: "$30 of awesome for $10", price: 10.0)
    assert voucher.save
  end
end