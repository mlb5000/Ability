require 'spec_helper'

describe RequirementReviewsController do
  test "should get index" do
    get :index, :product_id => products(:Ability).id
    assert_response :success
    assert_not_nil assigns(:requirement_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requirement_review" do
    assert_difference('RequirementReview.count') do
      post :create, :requirement_review => { :requirements => [requirements(:storyOne)] }
    end

    assert_redirected_to product_requirement_review_path(products(:Ability), assigns(:requirement_review))
  end

  test "should show requirement_review" do
    get :show, :id => requirement_reviews(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => requirement_reviews(:one).to_param
    assert_response :success
  end

  test "should update requirement_review" do
    put :update, :id => requirement_reviews(:one).to_param, :requirement_review => { }
    assert_redirected_to product_requirement_review_path(products(:Ability), assigns(:requirement_review))
  end

  test "should destroy requirement_review" do
    assert_difference('RequirementReview.count', -1) do
      delete :destroy, :id => requirement_reviews(:one).to_param
    end

    assert_redirected_to product_requirement_reviews_path(products(:Ability))
  end
end
