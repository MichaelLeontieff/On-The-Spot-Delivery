require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  setup do
    ActiveSupport::Deprecation.silenced = true
  end

  teardown do
    Rails.cache.clear
  end


  test "should login successfully with existing customer" do
    @attrs1 = {card_expiry: "06/20", card_no: "123456789012345", card_type: "VISA", ccv: "900", city: "Brisbane", email: "test@testing.com", first_name: "testFirstName", last_name: "testLastName", postcode: "0000", street: "Test Ave", suburb: "Testville", username:"testUsername", password: "testtest"}
    customer = Customer.create(@attrs1)

    get "/customer/login"
    assert_response :success


    post "/customer/login", {:session => { :email => customer.email, :password => customer.password}}
    follow_redirect!

    assert_equal '/main_page', path
    assert_equal 'You have successfully logged in', flash[:success]
  end

  test "should not login with non-existing customer" do
    get "/customer/login"
    post "/customer/login", {:session => { :email => "non-existent@123.com", :password => "1234"}}
    assert_equal '/customer/login', path
    assert_equal "There was something wrong with your login information", flash[:danger]

  end



end
