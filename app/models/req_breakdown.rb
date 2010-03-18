class ReqBreakdown < ActiveRecord::Base
  belongs_to :level0, :class_name => "RequirementLevel", :foreign_key => "level0_id"
  belongs_to :level1, :class_name => "RequirementLevel", :foreign_key => "level1_id"
  belongs_to :level2, :class_name => "RequirementLevel", :foreign_key => "level2_id"
  belongs_to :level3, :class_name => "RequirementLevel", :foreign_key => "level3_id"
  has_many :products

  def traceability
    return self.level0.abbreviation +
    (self.level1.nil? ? '' : "=>".concat(self.level1.abbreviation)) +
    (self.level2.nil? ? '' : "=>".concat(self.level2.abbreviation)) +
    (self.level3.nil? ? '' : "=>".concat(self.level3.abbreviation))
  end

  def levels
    return [self.level0, self.level1, self.level2, self.level3]
  end

  #necessary for formtastic
  def name 
    return traceability
  end
end
