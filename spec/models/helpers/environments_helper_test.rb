require 'test_helper'

class EnvironmentsHelperTest < ActionView::TestCase
  test "environment_factor_griddata_url works" do
    assert_equal "http://test.host/environments/1/factor_griddata", environment_factor_griddata_url(1)
  end
end
