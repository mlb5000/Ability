class QualityRisk < ActiveRecord::Base
  versioned

  belongs_to :mitigation_strategy
  belongs_to :product

  def unique_id
    return product.identifier + "-" + "QR" + "-" + (product.quality_risks.index(self)+1).to_s
  end
end
