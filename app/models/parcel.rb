class Parcel < ActiveRecord::Base
  self.primary_key = "id"
  belongs_to :customer
  #belongs_to :driver
end
