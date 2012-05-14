require 'test_helper'

class Admin::ComponentsControllerTest < ActionController::TestCase
  setup do
    @admin_component = admin_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_component" do
    assert_difference('Admin::Component.count') do
      post :create, admin_component: { agency_id: @admin_component.agency_id, component_type_id: @admin_component.component_type_id, content: @admin_component.content, template_id: @admin_component.template_id, title: @admin_component.title }
    end

    assert_redirected_to admin_component_path(assigns(:admin_component))
  end

  test "should show admin_component" do
    get :show, id: @admin_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_component
    assert_response :success
  end

  test "should update admin_component" do
    put :update, id: @admin_component, admin_component: { agency_id: @admin_component.agency_id, component_type_id: @admin_component.component_type_id, content: @admin_component.content, template_id: @admin_component.template_id, title: @admin_component.title }
    assert_redirected_to admin_component_path(assigns(:admin_component))
  end

  test "should destroy admin_component" do
    assert_difference('Admin::Component.count', -1) do
      delete :destroy, id: @admin_component
    end

    assert_redirected_to admin_components_path
  end
end
