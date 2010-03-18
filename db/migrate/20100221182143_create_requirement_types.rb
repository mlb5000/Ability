class CreateRequirementTypes < ActiveRecord::Migration
  def self.up
    create_table :requirement_types do |t|
      t.string :name

      t.timestamps
    end

    RequirementType.create :name=>"Functional"
    RequirementType.create :name=>"Appearance"
    RequirementType.create :name=>"Style"
    RequirementType.create :name=>"Ease of Use"
    RequirementType.create :name=>"Personalization and Internationalization"
    RequirementType.create :name=>"Learning"
    RequirementType.create :name=>"Speed and Latency"
    RequirementType.create :name=>"Safety-Critical"
    RequirementType.create :name=>"Precision or Accuracy"
    RequirementType.create :name=>"Reliability and Availability"
    RequirementType.create :name=>"Robustness or Fault-Tolerance"
    RequirementType.create :name=>"Reliability and Availability"
    RequirementType.create :name=>"Capacity"
    RequirementType.create :name=>"Scalability or Extensibility"
    RequirementType.create :name=>"Longevity"
    RequirementType.create :name=>"Productization"
    RequirementType.create :name=>"Maintenance"
    RequirementType.create :name=>"Supportability"
    RequirementType.create :name=>"Adaptability"
    RequirementType.create :name=>"Access"
    RequirementType.create :name=>"Integrity"
    RequirementType.create :name=>"Privacy"
    RequirementType.create :name=>"Audit"
    RequirementType.create :name=>"Immunity"
    RequirementType.create :name=>"Political"
    RequirementType.create :name=>"Compliance"
    RequirementType.create :name=>"Standards"
  end

  def self.down
    drop_table :requirement_types
  end
end
