require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  test "accessing users#new while logged in redirects to items#index" do
    UserSession.create(users(:eric))
    get :new
    assert_redirected_to root_url
    assert_equal "You must be logged out to access this page", flash[:notice]
  end

  test "accessing users#new while logged out renders page" do
    get :new
    assert assigns(:user)
    assert_template "users/new"
  end

  test "accessing users#create while logged in redirects to root_url" do
    UserSession.create(users(:eric))
    post :create
    assert_redirected_to root_url
    assert_equal "You must be logged out to access this page", flash[:notice]
  end

  test "create user with existing email render user#new" do
    post :create, user: { :email => users(:eric).email, :password => "test", :password_confirmation => "test" }
    assert_template "users/new"
    assert_select "h4.alert-heading", "There were some errors with your request:"
  end
end