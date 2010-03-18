class CreateRequirementRequirementReviews < ActiveRecord::Migration
  def self.up
    create_table :requirement_requirement_reviews do |t|
      t.integer :requirement_id
      t.integer :requirement_review_id

      t.timestamps
    end
  end

  def self.down
    drop_table :requirement_requirement_reviews
  end
end
