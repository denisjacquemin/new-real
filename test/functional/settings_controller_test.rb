require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should get :only" do
    get ::only
    assert_response :success
  end

  test "should get =" do
    get :=
    assert_response :success
  end

end
