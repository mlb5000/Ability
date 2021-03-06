require 'spec_helper'

describe Admin::ReqBreakdownsController do
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:req_breakdowns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create req_breakdown" do
    assert_difference('ReqBreakdown.count') do
      post :create, :req_breakdown => { }
    end

    assert_redirected_to admin_req_breakdowns_path
  end

  test "should show req_breakdown" do
    get :show, :id => req_breakdowns(:level0).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => req_breakdowns(:level0).to_param
    assert_response :success
  end

  test "should update req_breakdown" do
    put :update, :id => req_breakdowns(:level0).to_param, :req_breakdown => { }
    assert_redirected_to admin_req_breakdown_path
  end

  test "should destroy req_breakdown" do
    assert_difference('ReqBreakdown.count', -1) do
      delete :destroy, :id => req_breakdowns(:level0).to_param
    end

    assert_redirected_to admin_req_breakdowns_path
  end
end
