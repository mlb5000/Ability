class AddProductIdToRequirement < ActiveRecord::Migration
  def self.up
    add_column :requirements, :product_id, :integer
  end

  def self.down
    remove_column :requirements, :product_id
  end
end
