require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testAttrs = {card_expiry: "06/20", card_no: "12345678", card_type: "VISA", ccv: "900", city: "Brisbane", email: "test@testing.com", first_name: "testFirstName", last_name: "testLastName", postcode: "0000", street: "Test Ave", suburb: "Testville", username: "testUsername"}
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


  # test "should create customer" do
  #   assert_difference('Customer.count') do
  #     post customers_url, params: { customer: { card_expiry: @customer.card_expiry, card_no: @customer.card_no, card_type: @customer.card_type, ccv: @customer.ccv, city: @customer.city, email: @customer.email, first_name: @customer.first_name, last_name: @customer.last_name, postcode: @customer.postcode, street: @customer.street, suburb: @customer.suburb, username: @customer.username } }
  #   end
  #
  #   assert_redirected_to customer_url(Customer.last)
  # end
  #
  # test "should show customer" do
  #   get customer_url(@customer)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_customer_url(@customer)
  #   assert_response :success
  # end
  #
  # test "should update customer" do
  #   patch customer_url(@customer), params: { customer: { card_expiry: @customer.card_expiry, card_no: @customer.card_no, card_type: @customer.card_type, ccv: @customer.ccv, city: @customer.city, email: @customer.email, first_name: @customer.first_name, last_name: @customer.last_name, postcode: @customer.postcode, street: @customer.street, suburb: @customer.suburb, username: @customer.username } }
  #   assert_redirected_to customer_url(@customer)
  # end
  #
  # test "should destroy customer" do
  #   assert_difference('Customer.count', -1) do
  #     delete customer_url(@customer)
  #   end
  #
  #   assert_redirected_to customers_url
  # end

  test "should create customer" do
    assert Customer.create(@testAttrs)
  end

  test "should not create customer with existing email address" do
    Customer.create(@testAttrs)
    assert Customer = Customer.new(@testAttrs)
    assert Customer.invalid?
    assert Customer.errors.include?(:email)
  end

  # test "should not create customer with empty field" do
  #   #Checks each field in succession with all but one field non-empty
  #   @testAttrs.each do |key, value|
  #     tmp = key
  #     @testAttrs[key] = ""
  #     customer = Customer.new(@testAttrs)
  #     assert_not customer.save, "Saved Customer with no #{key}"
  #     @testAttrs[key] = tmp
  #   end
  # end

end
