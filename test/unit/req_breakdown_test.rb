require 'test_helper'

class ReqBreakdownTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "print traceability when traced down" do
    assert_equal("STRY=>SRS", req_breakdowns(:level0).traceabilityStr)
  end

  test "print traceability when single level" do
    assert_equal("STRY", req_breakdowns(:single).traceabilityStr)
  end
end
