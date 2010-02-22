class ReqBreakdown < ActiveRecord::Base
  belongs_to :next_level, :class_name => "ReqBreakdown", :foreign_key => "next_breakdown_id"
  belongs_to :requirement_level
  has_many :products
end
