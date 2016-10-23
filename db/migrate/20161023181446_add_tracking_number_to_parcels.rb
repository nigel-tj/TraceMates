class AddTrackingNumberToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :tracking_number, :string
  end
end
