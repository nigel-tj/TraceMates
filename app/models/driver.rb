class Driver < ActiveRecord::Base
  self.primary_key = "id"
  has_many :parcels
end
