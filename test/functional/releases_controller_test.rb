require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :product_id => products(:Ability).id
    assert_response :success
    assert_not_nil assigns(:releases)
  end

  test "should get new" do
    get :new, :product_id => products(:Ability).id
    assert_response :success
  end

  test "should create release" do
    assert_difference('Release.count') do
      post :create, :product_id => products(:Ability).id, :release => { }
    end

    assert_redirected_to product_release_path(products(:Ability), assigns(:release))
  end

  test "should show release" do
    get :show, :product_id => products(:Ability).id, :id => releases(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :product_id => products(:Ability).id, :id => releases(:one).to_param
    assert_response :success
  end

  test "should update release" do
    put :update, :product_id => products(:Ability).id, :id => releases(:one).to_param, :release => { }
    assert_redirected_to product_release_path(products(:Ability), assigns(:release))
  end

  test "should destroy release" do
    assert_difference('Release.count', -1) do
      delete :destroy, :id => releases(:one).to_param
    end

    assert_redirected_to product_releases_path(products(:Ability))
  end
end
