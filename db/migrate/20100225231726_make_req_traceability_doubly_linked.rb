class MakeReqTraceabilityDoublyLinked < ActiveRecord::Migration
  def self.up
    add_column :req_breakdowns, :previous_breakdown_id, :integer
  end

  def self.down
    remove_column :req_breakdowns, :previous_breakdown_id
  end
end
