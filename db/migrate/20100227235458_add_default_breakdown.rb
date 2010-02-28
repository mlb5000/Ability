class AddDefaultBreakdown < ActiveRecord::Migration
  def self.up
    @default = ReqBreakdown.new
    @default.level0_id=RequirementLevel.find_by_abbreviation("STRY").id
    @default.level1_id=RequirementLevel.find_by_abbreviation("SyRS").id
    @default.level2_id=RequirementLevel.find_by_abbreviation("SRS").id
    @default.save
  end

  def self.down
  end
end
