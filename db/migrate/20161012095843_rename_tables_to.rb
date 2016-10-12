class RenameTablesTo < ActiveRecord::Migration
  def change
    rename_table :driver, :drivers
    rename_table :customer, :customers
    rename_table :customer_parcel, :customer_parcels
    rename_table :location, :locations
    rename_table :parcel, :parcels
    rename_table :tracker, :trackers
    rename_table :tracker_location, :tracker_locations
    rename_table :tracker_parcel, :tracker_parcels
    
  end
end
