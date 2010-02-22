class Product < ActiveRecord::Base
  has_many :quality_risks
  has_many :requirements
  belongs_to :req_breakdown

  def traceability
    @current_level = req_breakdown
    @traceability = @current_level.requirement_level.name

    #follow the traceability tree until we encounter the lowest
    #traceability level, denoted by a nil next_level
    while @current_level.next_level != nil
      @current_level = @current_level.next_level
      @traceability += "=>".concat(@current_level.requirement_level.name)
    end

    return @traceability
  end
end
