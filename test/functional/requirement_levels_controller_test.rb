require 'test_helper'

class Admin::RequirementLevelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requirement_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requirement_level" do
    assert_difference('RequirementLevel.count') do
      post :create, :requirement_level => { }
    end

    assert_redirected_to admin_requirement_level_path(assigns(:requirement_level))
  end

  test "should show requirement_level" do
    get :show, :id => requirement_levels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => requirement_levels(:one).to_param
    assert_response :success
  end

  test "should update requirement_level" do
    put :update, :id => requirement_levels(:one).to_param, :requirement_level => { }
    assert_redirected_to admin_requirement_level_path(assigns(:requirement_level))
  end

  test "should destroy requirement_level" do
    assert_difference('RequirementLevel.count', -1) do
      delete :destroy, :id => requirement_levels(:one).to_param
    end

    assert_redirected_to admin_requirement_levels_path
  end
end
