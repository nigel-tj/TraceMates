class AddTrackerToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :tracker_id, :string
  end
end
