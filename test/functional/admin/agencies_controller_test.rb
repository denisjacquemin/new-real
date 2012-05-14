require 'test_helper'

class Admin::AgenciesControllerTest < ActionController::TestCase
  setup do
    @admin_agency = admin_agencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_agencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_agency" do
    assert_difference('Admin::Agency.count') do
      post :create, admin_agency: @admin_agency.attributes
    end

    assert_redirected_to admin_agency_path(assigns(:admin_agency))
  end

  test "should show admin_agency" do
    get :show, id: @admin_agency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_agency
    assert_response :success
  end

  test "should update admin_agency" do
    put :update, id: @admin_agency, admin_agency: @admin_agency.attributes
    assert_redirected_to admin_agency_path(assigns(:admin_agency))
  end

  test "should destroy admin_agency" do
    assert_difference('Admin::Agency.count', -1) do
      delete :destroy, id: @admin_agency
    end

    assert_redirected_to admin_agencies_path
  end
end
