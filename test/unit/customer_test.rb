require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "new customer with no name is invalid" do
    customer = Customer.new
    assert !customer.save
  end

  test "new customer with name is valid" do
    customer = Customer.new(full_name: "Eric Farkas")
    assert customer.save
  end
end
