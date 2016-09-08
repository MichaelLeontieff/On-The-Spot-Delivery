class ChangeOrderForm < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :destination_address_one
    remove_column :orders, :destination_address_two
    add_column :orders, :receiver_name, :string
    add_column :orders, :receiver_street, :string
    add_column :orders, :receiver_suburb, :string
    add_column :orders, :receiver_city, :string
    add_column :orders, :receiver_postcode, :string
    add_column :orders, :insurance, :string
  end
end
