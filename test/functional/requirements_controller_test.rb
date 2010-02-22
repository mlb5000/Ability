require 'test_helper'

class RequirementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requirement" do
    assert_difference('Requirement.count') do
      post :create, :requirement => { }
    end

    assert_redirected_to requirement_path(assigns(:requirement))
  end

  test "should show requirement" do
    get :show, :id => requirements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => requirements(:one).to_param
    assert_response :success
  end

  test "should update requirement" do
    put :update, :id => requirements(:one).to_param, :requirement => { }
    assert_redirected_to requirement_path(assigns(:requirement))
  end

  test "should destroy requirement" do
    assert_difference('Requirement.count', -1) do
      delete :destroy, :id => requirements(:one).to_param
    end

    assert_redirected_to requirements_path
  end
end
