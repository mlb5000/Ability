class EnvironmentConfigFactor < ActiveRecord::Base
  belongs_to :environment
  belongs_to :config_factor
end
