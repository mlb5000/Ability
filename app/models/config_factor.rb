class ConfigFactor < ActiveRecord::Base
  has_many :environment_config_factors
  has_many :environments, :through => :environment_config_factors
end
