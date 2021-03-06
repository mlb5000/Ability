class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.string :version
      t.date :startdate
      t.date :enddate
      t.integer :product_id
      t.string :goal

      t.timestamps
    end
  end

  def self.down
    drop_table :releases
  end
end
