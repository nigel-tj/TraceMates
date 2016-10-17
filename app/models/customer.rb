class Customer < ActiveRecord::Base
  has_many :parcels
end
