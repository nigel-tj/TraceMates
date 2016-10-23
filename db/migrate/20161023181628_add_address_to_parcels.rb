class AddAddressToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :address, :string
  end
end
