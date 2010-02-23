class AddDefaultReqBreakdown < ActiveRecord::Migration
  def self.up
    ReqBreakdown.create(:requirement_level_id => 1, :next_breakdown_id => 2)
    ReqBreakdown.create(:requirement_level_id => 2, :next_breakdown_id => 3)
    ReqBreakdown.create(:requirement_level_id => 3, :next_breakdown_id => 4)
    ReqBreakdown.create(:requirement_level_id => 4)    
  end

  def self.down
    ReqBreakdown.delete(1)
    ReqBreakdown.delete(2)
    ReqBreakdown.delete(3)
    ReqBreakdown.delete(4)
  end
end
