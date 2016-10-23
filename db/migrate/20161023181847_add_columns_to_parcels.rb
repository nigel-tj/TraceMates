class AddColumnsToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :city, :string
    add_column :parcels, :province, :string
  end
end
