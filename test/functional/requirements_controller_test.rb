require 'test_helper'

class RequirementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :product_id => products(:Ability).id
    assert_response :success
    assert_not_nil assigns(:requirements)
  end

  test "should get new" do
    get :new, :product_id => products(:Ability).id
    assert_response :success
  end

  test "should create requirement" do
    assert_difference('Requirement.count') do
      post :create, :product_id => products(:Ability).id, :requirement => { }
    end

    assert_redirected_to product_requirement_path(products(:Ability), assigns(:requirement))
  end

  test "should show requirement" do
    get :show, :product_id => products(:Ability).id, :id => requirements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :product_id => products(:Ability).id, :id => requirements(:one).to_param
    assert_response :success
  end

  test "should update requirement" do
    put :update, :product_id => products(:Ability).id, :id => requirements(:one).to_param, :requirement => { }
    assert_redirected_to product_requirement_path(products(:Ability), assigns(:requirement))
  end

  test "should destroy requirement" do
    assert_difference('Requirement.count', -1) do
      delete :destroy, :id => requirements(:one).to_param
    end

    assert_redirected_to product_requirements_path(products(:Ability))
  end
end
