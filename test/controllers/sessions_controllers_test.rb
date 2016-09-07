require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do

  end

  teardown do
    Rails.cache.clear
  end

  test "should get new" do
    get customer_login_path
    assert_response :success
  end

end
