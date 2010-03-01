class CreateConfigFactors < ActiveRecord::Migration
  def self.up
    create_table :config_factors do |t|
      t.string :name

      t.timestamps
    end
    ConfigFactor.create :name => "Operating System"
    ConfigFactor.create :name => "Browser"
    ConfigFactor.create :name => "Memory"
  end

  def self.down
    drop_table :config_factors
  end
end
