require 'test_helper'

class Admin::FieldTypesControllerTest < ActionController::TestCase
  setup do
    @admin_field_type = admin_field_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_field_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_field_type" do
    assert_difference('Admin::FieldType.count') do
      post :create, admin_field_type: { label: @admin_field_type.label }
    end

    assert_redirected_to admin_field_type_path(assigns(:admin_field_type))
  end

  test "should show admin_field_type" do
    get :show, id: @admin_field_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_field_type
    assert_response :success
  end

  test "should update admin_field_type" do
    put :update, id: @admin_field_type, admin_field_type: { label: @admin_field_type.label }
    assert_redirected_to admin_field_type_path(assigns(:admin_field_type))
  end

  test "should destroy admin_field_type" do
    assert_difference('Admin::FieldType.count', -1) do
      delete :destroy, id: @admin_field_type
    end

    assert_redirected_to admin_field_types_path
  end
end
