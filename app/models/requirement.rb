class Requirement < ActiveRecord::Base
  belongs_to :requirement_type
  belongs_to :requirement_level
  belongs_to :product
end
