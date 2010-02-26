require 'test_helper'

class QualityRisksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :product_id => products(:Ability).id
    assert_response :success
    assert_not_nil assigns(:quality_risks)
  end

  test "should get new" do
    get :new, :product_id => products(:Ability).id
    assert_response :success
  end

  test "should create quality_risk" do
    assert_difference('QualityRisk.count') do
      post :create, :product_id => products(:Ability).id, :quality_risk => { :risk_category_id => 1, :description => 'Description', :mitigation_strategy_id => 1, :explanation => '', :likelihood => 4, :impact => 3 }
    end

    assert_redirected_to product_quality_risk_path(products(:Ability), assigns(:quality_risk))
  end

  test "should show quality_risk" do
    get :show, :product_id => products(:Ability).id, :id => quality_risks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :product_id => products(:Ability).id, :id => quality_risks(:one).to_param
    assert_response :success
  end

  test "should update quality_risk" do
    put :update, :product_id => products(:Ability).id, :id => quality_risks(:one).to_param, :quality_risk => { }
    assert_redirected_to product_quality_risk_path(products(:Ability), assigns(:quality_risk))
  end

  test "should destroy quality_risk" do
    assert_difference('QualityRisk.count', -1) do
      delete :destroy, :id => quality_risks(:one).to_param
    end

    assert_redirected_to product_quality_risks_path(products(:Ability))
  end
end
