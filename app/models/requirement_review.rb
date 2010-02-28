class RequirementReview < ActiveRecord::Base
  has_and_belongs_to_many :requirements
  belongs_to :product
end
