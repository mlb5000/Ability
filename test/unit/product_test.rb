require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = products(:Ability)
  end
  # Replace this with your real tests.
  test "that products have requirement breakdowns" do
    assert @product.req_breakdown.level0.name == 'User Story'
  end

  test "can count tests at level" do
    assert @product.tests_at_level(requirement_levels(:one)) == 3
  end

  test "can count requirements covered by test" do
    assert @product.req_verified_by_test(requirement_levels(:one)) == true
  end

  test "can retrieve requirement reviews" do
    assert @product.requirement_reviews != nil
    assert @product.requirement_reviews.count == 2
  end
end
