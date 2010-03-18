class SetEmptyStringDefaultOnRequirementLevelAbbreviation < ActiveRecord::Migration
  def self.up
    change_column :requirement_levels, :abbreviation, :string, :default => ''
  end

  def self.down
    change_column :requirement_levels, :abbreviation, :string, :default => nil
  end
end
