require 'test_helper'

class ReqBreakdownTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "print traceability when traced down" do
    assert_equal("STRY=>SRS=>SyRS", req_breakdowns(:level0).traceability)
  end

  test "print traceability when single level" do
    assert_equal("STRY", req_breakdowns(:singleTrace).traceability)
  end
end
