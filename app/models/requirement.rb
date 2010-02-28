class Requirement < ActiveRecord::Base
  belongs_to :requirement_type
  belongs_to :requirement_level
  belongs_to :product
  has_and_belongs_to_many :requirement_reviews

  def unique_id
    return self.product.identifier + '-' +
           self.requirement_level.abbreviation + '-' +
           Requirement.all(:order => "created_at",
                           :conditions => ["requirement_level_id = ? AND product_id = ?",
                                           self.requirement_level.id,
                                           self.product.id]).index(self)
  end
end
