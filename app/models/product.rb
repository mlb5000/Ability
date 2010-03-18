class Product < ActiveRecord::Base
  has_many :releases
  has_many :quality_risks
  has_many :requirements
  has_many :requirement_reviews
  belongs_to :req_breakdown

  def tests_at_level(level)
    if req_breakdown.levels.index(level) != nil
      return 3
    end
    return 0
  end

  def req_verified_by_test(level)
    if req_breakdown.levels.index(level) != nil
      return true
    end              
    return false
  end
end
