class Changereqbreakdownstructure < ActiveRecord::Migration
  def self.up
    remove_column :req_breakdowns, :higher_level_id
    remove_column :req_breakdowns, :lower_level_id
    remove_column :req_breakdowns, :is_highest
    remove_column :req_breakdowns, :is_lowest
    add_column :req_breakdowns, :requirement_level_id, :integer
    add_column :req_breakdowns, :next_breakdown_id, :integer
  end

  def self.down
    remove_column :req_breakdowns, :requirement_level_id
    remove_column :req_breakdowns, :next_breakdown_id
    add_column :req_breakdowns, :higher_level_id, :integer
    add_column :req_breakdowns, :lower_level_id, :integer
    add_column :req_breakdowns, :is_highest, :boolean
    add_column :req_breakdowns, :is_lowest, :boolean
  end
end
