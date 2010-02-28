class RenameRequirementsRequirementReviewsTable < ActiveRecord::Migration
  def self.up
    rename_table :requirements_requirement_reviews, :requirement_reviews_requirements
  end

  def self.down
    rename_table :requirement_reviews_requirements, :requirements_requirement_reviews
  end
end
