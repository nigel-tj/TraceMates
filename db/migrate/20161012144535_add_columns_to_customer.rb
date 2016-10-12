class AddColumnsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :province, :string
    add_column :customers, :city, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :tracking_number, :string
  end
end
