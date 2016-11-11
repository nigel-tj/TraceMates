class AddDeliveredFlagToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :delivered_flag, :string, :limit => 1
  end
end
