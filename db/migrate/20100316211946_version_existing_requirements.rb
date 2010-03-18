class VersionExistingRequirements < ActiveRecord::Migration
  def self.up
    say_with_time "Setting initial version for requirements." do
      Requirement.find_each(&:touch)
    end
  end

  def self.down
  end
end
