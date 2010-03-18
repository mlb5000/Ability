require 'spec_helper'

class EnvironmentTest < ActiveSupport::TestCase

  def setup
    @environment = environments(:one)
  end

  test "environments have config_factors" do
    assert @environment.environment_config_factors.count == 3
  end

  # Replace this with your real tests.
  test "environment one configured properly" do
    assert_equal "Vista Development Box", @environment.name
    assert @environment.configuration.index("Memory:8GB") != nil
    assert @environment.configuration.index("Browser:Firefox 3.5") != nil
    assert @environment.configuration.index("Operating System:Windows Vista Ultimate") != nil
  end

  test "environment two configured properly" do
    @environment = environments(:two)
    assert_equal "Macbook", @environment.name
    assert @environment.configuration.index("Memory:2GB") != nil
    assert @environment.configuration.index("Browser:Chrome") != nil
    assert @environment.configuration.index("Operating System:Mac OS 10.5") != nil
  end
end
