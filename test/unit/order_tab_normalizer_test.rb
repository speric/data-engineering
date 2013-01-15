require 'test_helper'

class OrderTabNormalizerTest < ActiveSupport::TestCase

  test "normalizer will create a new voucher if voucher doesn't exist" do
    order = OrderTabNormalizer.normalize(["Amy Pond", "$20 Boots for $5", "10.0", "2", "987 Fake St", "Bob's Pizza"])
    assert_equal order.customer_id, customers(:amy_pond).id
    assert order.voucher_id != vouchers(:sneakers).id
    assert_equal order.merchant_id, merchants(:bobs_pizza).id
    assert_equal order.voucher_count, 2
    assert_equal order.total_revenue, 20.0
    assert order.save
  end

  test "normalizer will produce a valid Order based on existing data" do
    order = OrderTabNormalizer.normalize(["Amy Pond", "$20 Sneakers for $5", "10.0", "2", "987 Fake St", "Bob's Pizza"])
    assert_equal order.customer_id, customers(:amy_pond).id
    assert_equal order.voucher_id, vouchers(:sneakers).id
    assert_equal order.merchant_id, merchants(:bobs_pizza).id
    assert_equal order.voucher_count, 2
    assert_equal order.total_revenue, 20.0
    assert order.save
  end
end
