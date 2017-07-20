require 'test_helper'

class PhoneDetailsControllerTest < ActionController::TestCase
  setup do
    @phone_detail = phone_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phone_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phone_detail" do
    assert_difference('PhoneDetail.count') do
      post :create, phone_detail: { battery: @phone_detail.battery, display: @phone_detail.display, display: @phone_detail.display, name: @phone_detail.name, processor: @phone_detail.processor, storage: @phone_detail.storage }
    end

    assert_redirected_to phone_detail_path(assigns(:phone_detail))
  end

  test "should show phone_detail" do
    get :show, id: @phone_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phone_detail
    assert_response :success
  end

  test "should update phone_detail" do
    patch :update, id: @phone_detail, phone_detail: { battery: @phone_detail.battery, display: @phone_detail.display, display: @phone_detail.display, name: @phone_detail.name, processor: @phone_detail.processor, storage: @phone_detail.storage }
    assert_redirected_to phone_detail_path(assigns(:phone_detail))
  end

  test "should destroy phone_detail" do
    assert_difference('PhoneDetail.count', -1) do
      delete :destroy, id: @phone_detail
    end

    assert_redirected_to phone_details_path
  end
end
