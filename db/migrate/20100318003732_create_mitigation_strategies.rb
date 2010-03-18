class CreateMitigationStrategies < ActiveRecord::Migration
  def self.up
    create_table :mitigation_strategies do |t|
      t.string :name
      t.string :explanation

      t.timestamps
    end
    
    MitigationStrategy.create :name => "Testing", :explanation => "Mitigate this risk by testing the software for this failure."
    MitigationStrategy.create :name => "Transfer", :explanation => "Transfer this risk to another group, organization, or system."
    MitigationStrategy.create :name => "Contingencies", :explanation => "Develop a plan of action to mitigate this risk should it arise."
    MitigationStrategy.create :name => "Ignore", :explanation => "Accept this risk and ignore it entirely."
  end

  def self.down
    drop_table :mitigation_strategies
  end
end
