class QualityRisk < ActiveRecord::Base
  versioned

  belongs_to :mitigation_strategy
  belongs_to :product
end
