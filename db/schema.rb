# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100226033408) do

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "identifier",         :limit => 3
    t.integer  "req_breakdown_id"
    t.string   "jira_defect_filter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quality_risks", :force => true do |t|
    t.integer  "product_id"
    t.integer  "risk_category_id"
    t.string   "description"
    t.integer  "mitigation_strategy_id"
    t.string   "explanation"
    t.integer  "likelihood"
    t.integer  "impact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", :force => true do |t|
    t.string   "version"
    t.date     "startdate"
    t.date     "enddate"
    t.integer  "product_id"
    t.string   "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "req_breakdowns", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "requirement_level_id"
    t.integer  "next_breakdown_id"
    t.integer  "previous_breakdown_id"
  end

  create_table "requirement_levels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation", :default => ""
  end

  create_table "requirement_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requirements", :force => true do |t|
    t.integer  "requirement_level_id"
    t.integer  "requirement_type_id"
    t.string   "description"
    t.string   "rationale"
    t.string   "originator"
    t.string   "fit_criterion"
    t.integer  "source_id"
    t.integer  "priority"
    t.integer  "satisfaction"
    t.integer  "dissatisfaction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

end
