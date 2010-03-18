class CreateReqBreakdowns < ActiveRecord::Migration
  def self.up
    create_table :req_breakdowns do |t|
      t.integer :higher_level_id
      t.integer :lower_level_id
      t.boolean :is_highest
      t.boolean :is_lowest

      t.timestamps
    end
  end

  def self.down
    drop_table :req_breakdowns
  end
end
