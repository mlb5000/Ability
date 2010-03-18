class CreateRequirements < ActiveRecord::Migration
  def self.up
    create_table :requirements do |t|
      t.integer :requirement_level_id
      t.integer :requirement_type_id
      t.string :description
      t.string :rationale
      t.string :originator
      t.string :fit_criterion
      t.integer :source_id
      t.integer :priority
      t.integer :satisfaction
      t.integer :dissatisfaction

      t.timestamps
    end
  end

  def self.down
    drop_table :requirements
  end
end
