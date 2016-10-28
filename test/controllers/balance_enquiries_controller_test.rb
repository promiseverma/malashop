require 'test_helper'

class BalanceEnquiriesControllerTest < ActionController::TestCase
  setup do
    @balance_enquiry = balance_enquiries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:balance_enquiries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create balance_enquiry" do
    assert_difference('BalanceEnquiry.count') do
      post :create, balance_enquiry: { balance_date: @balance_enquiry.balance_date, dena: @balance_enquiry.dena, lena: @balance_enquiry.lena }
    end

    assert_redirected_to balance_enquiry_path(assigns(:balance_enquiry))
  end

  test "should show balance_enquiry" do
    get :show, id: @balance_enquiry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @balance_enquiry
    assert_response :success
  end

  test "should update balance_enquiry" do
    patch :update, id: @balance_enquiry, balance_enquiry: { balance_date: @balance_enquiry.balance_date, dena: @balance_enquiry.dena, lena: @balance_enquiry.lena }
    assert_redirected_to balance_enquiry_path(assigns(:balance_enquiry))
  end

  test "should destroy balance_enquiry" do
    assert_difference('BalanceEnquiry.count', -1) do
      delete :destroy, id: @balance_enquiry
    end

    assert_redirected_to balance_enquiries_path
  end
end
