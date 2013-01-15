require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "blank order is invalid" do
    order = Order.new
    assert !order.save
  end

  test "order with customer and merchant but without voucher is invalid" do
    order = Order.new
    order.customer = customers(:amy_pond)
    order.merchant = merchants(:bobs_pizza)
    assert !order.save
  end

  test "order with customer and voucher but without merchant is invalid" do
    order = Order.new
    order.customer = customers(:amy_pond)
    order.voucher = vouchers(:sneakers)
    order.voucher_count = 3
    assert !order.save
  end

  test "order with merchant and voucher but without customer is invalid" do
    order = Order.new
    order.merchant = merchants(:bobs_pizza)
    order.voucher = vouchers(:sneakers)
    order.voucher_count = 3
    assert !order.save
  end

  test "order with customer, merchant, voucher, but without voucher count is invalid" do
    order = Order.new
    order.customer = customers(:amy_pond)
    order.merchant = merchants(:bobs_pizza)
    order.voucher = vouchers(:sneakers)
    assert !order.save
  end

  test "order with customer, merchant, voucher, with voucher count as 0 is invalid" do
    order = Order.new
    order.customer = customers(:amy_pond)
    order.merchant = merchants(:bobs_pizza)
    order.voucher = vouchers(:sneakers)
    order.voucher_count = 0
    assert !order.save
  end

  test "order with customer, merchant, voucher, and voucher count is valid and total price is correct" do
    order = Order.new
    order.customer = customers(:amy_pond)
    order.merchant = merchants(:bobs_pizza)
    order.voucher = vouchers(:sneakers)
    order.voucher_count = 3
    assert order.save
    assert_equal order.total_price, 30.0
  end
end
