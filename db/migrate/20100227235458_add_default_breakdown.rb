class AddDefaultBreakdown < ActiveRecord::Migration
  def self.up
    RequirementLevel.delete_all
    RequirementLevel.create :name => "User Story", :abbreviation => "STRY"
    RequirementLevel.create :name => "System Requirement", :abbreviation => "SyRS"
    RequirementLevel.create :name => "Software Requirement", :abbreviation => "SRS"
    @default = ReqBreakdown.new
    @default.level0_id=RequirementLevel.find_by_abbreviation("STRY").id
    @default.level1_id=RequirementLevel.find_by_abbreviation("SyRS").id
    @default.level2_id=RequirementLevel.find_by_abbreviation("SRS").id
    @default.save
  end

  def self.down
  end
end
