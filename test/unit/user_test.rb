require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user with no email address is invalid" do
    user = User.new
    user.email = ""
    user.full_name = "Eric Farkas"
    user.password = "test"
    user.password_confirmation = "test"
    assert !user.save
  end

  test "user with invalid email address is invalid" do
    user = User.new
    user.email = "eric"
    user.full_name = "Eric Farkas"
    user.password = "test"
    user.password_confirmation = "test"
    assert !user.save
  end

  test "user with no name is invalid" do
    user = User.new
    user.email = "eric@prudentiadigital.com"
    user.password = "test"
    user.password_confirmation = "test"
    assert !user.save
  end

  test "user with mismatching passwords is invalid" do
    user = User.new
    user.email = "eric@prudentiadigital.com"
    user.full_name = "Eric Farkas"
    user.password = "test"
    user.password_confirmation = "test1"
    assert !user.save
  end
  
  test "user with no passwords is invalid" do
    user = User.new
    user.email = "eric@prudentiadigital.com"
    user.full_name = "Eric Farkas"
    assert !user.save
  end

  test "user with short passwords is invalid" do
    user = User.new
    user.email = "eric@prudentiadigital.com"
    user.full_name = "Eric Farkas"
    user.password = "t"
    user.password_confirmation = "t"
    assert !user.save
  end
  
  test "user with existing email address is invalid" do
    user = User.new
    user.email = "engineering@prudentiadigital.com"
    user.full_name = "Eric Farkas"
    user.password = "t"
    user.password_confirmation = "t"
    assert !user.save #user already in db via fixtures
  end
  
  test "user with email address, password and full name valid" do
    user = User.new
    user.email = "eric@prudentiadigital.com"
    user.full_name = "Eric Farkas"
    user.password = "test"
    user.password_confirmation = "test"
    assert user.save
  end
end
