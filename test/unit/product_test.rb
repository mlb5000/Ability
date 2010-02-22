require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = products(:Ability)
  end
  # Replace this with your real tests.
  test "that products have requirement breakdowns" do
    assert @product.req_breakdown.requirement_level.name == 'User Story'
  end

  test "print traceability" do
    assert_equal("User Story=>SRS=>HLD=>LLD", @product.traceability)
  end
end
