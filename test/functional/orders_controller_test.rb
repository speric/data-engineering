require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  test "should get index with no errors" do
    UserSession.create(users(:eric))
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end
end
