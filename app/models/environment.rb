class Environment < ActiveRecord::Base
  has_many :environment_config_factors
  has_many :config_factors, :through => :environment_config_factors

  def configuration
    return self.environment_config_factors.collect {|x| x.config_factor.name + ":" + x.value }
  end
end
