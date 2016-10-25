class AddTrackerIdAndTrackingNumberToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :tracking_number, :string
    add_column :locations, :tracker_id, :string
  end
end
