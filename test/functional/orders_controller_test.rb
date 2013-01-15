require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get index with no errors" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end
end
