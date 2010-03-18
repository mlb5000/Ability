class RequirementRequirementReview < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :requirement_review
end
