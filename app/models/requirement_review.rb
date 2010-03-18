class RequirementReview < ActiveRecord::Base
  #attr_accessible :id, :title, :description, :product_id, :requirement_ids
  has_many :requirement_requirement_reviews
  has_many :requirements, :through => :requirement_requirement_reviews
  belongs_to :product
 
  def unique_id
    return product.identifier + "-RR-" + (product.requirement_reviews.index(self)+1).to_s
  end
end
