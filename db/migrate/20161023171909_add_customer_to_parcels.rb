class AddCustomerToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :customer_id, :integer
  end
end
