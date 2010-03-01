require 'test_helper'

class RequirementReviewTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "one has four requirements" do
    assert_equal 4, requirement_reviews(:one).requirements.count
  end

  test "two has three requirements" do
    assert_equal 3, requirement_reviews(:two).requirements.count
  end

  test "three has one requirement" do
    assert_equal 1, requirement_reviews(:three).requirements.count
  end
end
