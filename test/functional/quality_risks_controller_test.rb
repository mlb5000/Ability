require 'test_helper'

class QualityRisksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quality_risks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quality_risk" do
    assert_difference('QualityRisk.count') do
      post :create, :quality_risk => { }
    end

    assert_redirected_to quality_risk_path(assigns(:quality_risk))
  end

  test "should show quality_risk" do
    get :show, :id => quality_risks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => quality_risks(:one).to_param
    assert_response :success
  end

  test "should update quality_risk" do
    put :update, :id => quality_risks(:one).to_param, :quality_risk => { }
    assert_redirected_to quality_risk_path(assigns(:quality_risk))
  end

  test "should destroy quality_risk" do
    assert_difference('QualityRisk.count', -1) do
      delete :destroy, :id => quality_risks(:one).to_param
    end

    assert_redirected_to quality_risks_path
  end
end
