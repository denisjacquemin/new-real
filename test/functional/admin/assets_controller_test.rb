require 'test_helper'

class Admin::AssetsControllerTest < ActionController::TestCase
  setup do
    @admin_asset = admin_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_asset" do
    assert_difference('Admin::Asset.count') do
      post :create, admin_asset: {  }
    end

    assert_redirected_to admin_asset_path(assigns(:admin_asset))
  end

  test "should show admin_asset" do
    get :show, id: @admin_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_asset
    assert_response :success
  end

  test "should update admin_asset" do
    put :update, id: @admin_asset, admin_asset: {  }
    assert_redirected_to admin_asset_path(assigns(:admin_asset))
  end

  test "should destroy admin_asset" do
    assert_difference('Admin::Asset.count', -1) do
      delete :destroy, id: @admin_asset
    end

    assert_redirected_to admin_assets_path
  end
end
