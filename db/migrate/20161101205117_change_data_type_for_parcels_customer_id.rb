class ChangeDataTypeForParcelsCustomerId < ActiveRecord::Migration
  def change
    change_column :parcels, :customer_id, :string
  end
end
