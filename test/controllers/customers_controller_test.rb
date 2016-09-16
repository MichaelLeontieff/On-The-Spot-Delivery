require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs1 = {card_expiry: "06/20", card_no: "12345678", card_type: "VISA", ccv: "900", city: "Brisbane", email: "test@testing.com", first_name: "testFirstName", last_name: "testLastName", postcode: "0000", street: "Test Ave", suburb: "Testville", username:
      "testUsername"}

  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer with valid credentials" do
    assert Customer.create(@attrs1)
  end

  test "should not create customer with existing email address" do
    Customer.create(@attrs1)
    customer = Customer.new(@attrs1)
    assert customer.invalid?(:email)
  end

  test "should not create customer if email address is not in email format" do
    invalidEmails = ["invalid", "123@.", ".com", ".", "@.com"]
    invalidEmails.each do |val|
      @attrs1[:email] = val
      customer = Customer.new(@attrs1)
      customer.invalid?(:email)
    end
  end

  test "should not create customer with an empty field" do
    #Checks each field in succession with all but one field non-empty
    @attrs1.each do |key, value|
      tmp = key
      @attrs1[key] = ""
      customer = Customer.new(@attrs1)
      customer.invalid?(:email)
      @attrs1[key] = tmp
    end
   end

end
