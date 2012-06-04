require 'test_helper'

class Admin::FieldValuesControllerTest < ActionController::TestCase
  setup do
    @admin_field_value = admin_field_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_field_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_field_value" do
    assert_difference('Admin::FieldValue.count') do
      post :create, admin_field_value: { field_id: @admin_field_value.field_id, item_id: @admin_field_value.item_id, value: @admin_field_value.value }
    end

    assert_redirected_to admin_field_value_path(assigns(:admin_field_value))
  end

  test "should show admin_field_value" do
    get :show, id: @admin_field_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_field_value
    assert_response :success
  end

  test "should update admin_field_value" do
    put :update, id: @admin_field_value, admin_field_value: { field_id: @admin_field_value.field_id, item_id: @admin_field_value.item_id, value: @admin_field_value.value }
    assert_redirected_to admin_field_value_path(assigns(:admin_field_value))
  end

  test "should destroy admin_field_value" do
    assert_difference('Admin::FieldValue.count', -1) do
      delete :destroy, id: @admin_field_value
    end

    assert_redirected_to admin_field_values_path
  end
end
