class CreateRequirementsRequirementReviewsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :requirements_requirement_reviews, :id => false do |t|
      t.integer :requirement_id
      t.integer :requirement_review_id
    end
  end

  def self.down
    drop_table :requirements_requirement_reviews
  end
end
