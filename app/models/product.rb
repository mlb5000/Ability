class Product < ActiveRecord::Base
  has_many :releases
  has_many :quality_risks
  has_many :requirements
  belongs_to :req_breakdown
end
