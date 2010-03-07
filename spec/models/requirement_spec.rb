require 'spec_helper'

class RequirementTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "requirement unique id" do
    assert_equal requirements(:syRsOne).unique_id, "ABL-SyRS-1"
    assert_equal requirements(:srsOne).unique_id, "ABL-SRS-1"
    assert_equal requirements(:storyOne).unique_id, "ABL-STRY-1"
    assert_equal requirements(:syRsTwo).unique_id, "ABL-SyRS-2"
  end
end
