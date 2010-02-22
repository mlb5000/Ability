class CreateRequirementLevels < ActiveRecord::Migration
  def self.up
    create_table :requirement_levels do |t|
      t.string :name

      t.timestamps
    end

    RequirementLevel.create :name=>"User Story"
    RequirementLevel.create :name=>"SRS"
    RequirementLevel.create :name=>"HLD"
    RequirementLevel.create :name=>"LLD"
  end

  def self.down
    drop_table :requirement_levels
  end
end
