class FlattenReqBreakdownTable < ActiveRecord::Migration
  def self.up
    remove_column :req_breakdowns, :requirement_level_id
    remove_column :req_breakdowns, :next_breakdown_id
    remove_column :req_breakdowns, :previous_breakdown_id
    add_column :req_breakdowns, :level0_id, :integer
    add_column :req_breakdowns, :level1_id, :integer
    add_column :req_breakdowns, :level2_id, :integer
    add_column :req_breakdowns, :level3_id, :integer    
  end

  def self.down
    remove_column :req_breakdowns, :level0_id
    remove_column :req_breakdowns, :level1_id
    remove_column :req_breakdowns, :level2_id
    remove_column :req_breakdowns, :level3_id
    add_column :req_breakdowns, :requirement_level_id, :integer
    add_column :req_breakdowns, :next_breakdown_id, :integer
    add_column :req_breakdowns, :previous_breakdown_id, :integer
  end
end
