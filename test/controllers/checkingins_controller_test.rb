require 'test_helper'

class CheckinginsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkingin = checkingins(:one)
  end

  test "should get index" do
    get checkingins_url
    assert_response :success
  end

  test "should get new" do
    get new_checkingin_url
    assert_response :success
  end

  test "should create checkingin" do
    assert_difference('Checkingin.count') do
      post checkingins_url, params: { checkingin: { checked_in: @checkingin.checked_in, id: @checkingin.id } }
    end

    assert_redirected_to checkingin_url(Checkingin.last)
  end

  test "should show checkingin" do
    get checkingin_url(@checkingin)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkingin_url(@checkingin)
    assert_response :success
  end

  test "should update checkingin" do
    patch checkingin_url(@checkingin), params: { checkingin: { checked_in: @checkingin.checked_in, id: @checkingin.id } }
    assert_redirected_to checkingin_url(@checkingin)
  end

  test "should destroy checkingin" do
    assert_difference('Checkingin.count', -1) do
      delete checkingin_url(@checkingin)
    end

    assert_redirected_to checkingins_url
  end
end
