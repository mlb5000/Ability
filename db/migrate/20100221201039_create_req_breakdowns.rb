class CreateReqBreakdowns < ActiveRecord::Migration
  def self.up
    create_table :req_breakdowns do |t|
      t.integer :requirement_level_id, :null => false
      t.integer :next_breakdown_id

      t.timestamps
    end
  end

  def self.down
    drop_table :req_breakdowns
  end
end
