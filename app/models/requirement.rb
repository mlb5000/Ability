class Requirement < ActiveRecord::Base
  versioned

  belongs_to :requirement_type
  belongs_to :requirement_level
  belongs_to :product
  has_many :requirement_requirement_reviews
  has_many :requirement_reviews, :through => :requirement_requirement_reviews

  def unique_id
    return self.product.identifier + '-' +
           self.requirement_level.abbreviation + '-' +
           (Requirement.all(:order => "created_at",
                           :conditions => ["requirement_level_id = ? AND product_id = ?",
                                           self.requirement_level.id,
                                           self.product.id]).index(self)+1).to_s
  end

  def name
    return unique_id + ' - ' + description[0..15]
  end

  def derived_priority
    if satisfaction.nil? or dissatisfaction.nil? or priority.nil? then
      return 1
    end
    return (100*(satisfaction*dissatisfaction)*(1.0/priority)).round/100.0
  end
end
