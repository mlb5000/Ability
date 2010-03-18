class CreateQualityRisks < ActiveRecord::Migration
  def self.up
    create_table :quality_risks do |t|
      t.integer :product_id
      t.integer :risk_category_id
      t.string :description
      t.integer :mitigation_strategy_id
      t.string :explanation
      t.integer :likelihood
      t.integer :impact

      t.timestamps
    end
  end

  def self.down
    drop_table :quality_risks
  end
end
