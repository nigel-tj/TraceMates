class AddColumnsToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :bank_name, :string
    add_column :drivers, :branch_code, :string
    add_column :drivers, :account_holder, :string
    add_column :drivers, :account_number, :string
    add_column :drivers, :account_type, :string
    add_column :drivers, :province, :string
    add_column :drivers, :city, :string
    add_column :drivers, :postal_code, :string
  end
end
