class AssociateProductWithRequirementReview < ActiveRecord::Migration
  def self.up
    add_column :requirement_reviews, :product_id, :integer
  end

  def self.down
    remove_column :requirement_reviews, :product_id
  end
end
