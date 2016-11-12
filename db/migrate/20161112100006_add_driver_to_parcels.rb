class AddDriverToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :driver_id, :string
  end
end
