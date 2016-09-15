require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  setup do

  end

  teardown do
    Rails.cache.clear
  end

  test "login with incorrect information" do
    get customer_login_path
    assert_template 'customer_sessions/new'
    post customer_login_path, params: {session: {email: "", password: ""}}
    assert_template 'customer_sessions/new'
  end

  # test "login with correct information" do
  #   get customer_login_path
  #   assert_template 'sessions/new'
  #   post customer_login_path, params: {session: {email: "test@test.com", password: "test"}}
  #   assert_template 'customers/main_page'
  # end

end
