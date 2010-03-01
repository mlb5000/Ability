class CreateEnvironmentConfigFactors < ActiveRecord::Migration
  def self.up
    create_table :environment_config_factors, :id => false do |t|
      t.integer :environment_id
      t.integer :config_factor_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :environment_config_factors
  end
end
