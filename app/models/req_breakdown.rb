class ReqBreakdown < ActiveRecord::Base
  belongs_to :next_level, :class_name => "ReqBreakdown", :foreign_key => "next_breakdown_id"
  belongs_to :previous_level, :class_name => "ReqBreakdown", :foreign_key => "previous_breakdown_id"
  belongs_to :requirement_level
  has_many :products

  def traceabilityStr
    #find highest level
    @highest = self
    while(@highest.previous_level != nil)
      @highest = @highest.previous_level
    end

    @traceability = @highest.requirement_level.abbreviation
    while @highest.next_level != nil
      @highest = @highest.next_level
      @traceability += "=>".concat(@highest.requirement_level.abbreviation)
    end

    return @traceability
  end
end
