class AddAbbreviationToRequirementLevel < ActiveRecord::Migration
  def self.up
    add_column :requirement_levels, :abbreviation, :string
  end

  def self.down
    remove_column :requirement_levels, :abbreviation
  end
end
