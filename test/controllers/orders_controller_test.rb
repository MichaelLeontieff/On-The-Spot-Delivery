require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orderAttrs = {pickup_time: "12:00", no_packages: "5", gross_weight: "5", receiver_name: "Test", receiver_street: "Test Ave", receiver_suburb: "Test", receiver_city: "Testville", receiver_postcode: "1234", insurance: "Yes"}
  end

  teardown do
    Rails.cache.clear
  end

  test "should create order with valid information" do
    assert Order.create(@orderAttrs)
  end

  test "should not create order with an empty field" do
    @orderAttrs.each do |key, value|
      tmp = key
      @orderAttrs[key] = ""
      order = Order.new(@orderAttrs)
      assert_not order.save, "Saved Order with no #{key}"
      @orderAttrs[key] = tmp
    end
  end

  test "should not create order if time is not in time format" do
    invalidTimes = ["HAMMERTIME", "1234", "12oClock", "LunchTime"]
    invalidTimes.each do |val|
      @orderAttrs[:pickup_time] = val
      order = Order.new(@orderAttrs)
      assert_not order.save, "Saved Order with invalid time: #{val}"
    end
  end
end
