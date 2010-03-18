class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :identifier, :limit=>3
      t.integer :req_breakdown_id
      t.string :jira_defect_filter

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
