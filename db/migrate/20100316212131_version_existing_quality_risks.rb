class VersionExistingQualityRisks < ActiveRecord::Migration
  def self.up
    say_with_time "Setting initial version for quality risks." do
      QualityRisk.find_each(&:touch)
    end
  end

  def self.down
  end
end
