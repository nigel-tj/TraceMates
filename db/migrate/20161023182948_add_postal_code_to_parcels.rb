class AddPostalCodeToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :postal_code, :string
  end
end
