class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :no_packages
      t.string :gross_weight
      t.string :pickup_time
      t.string :destination_address_one
      t.string :destination_address_two

      t.timestamps
    end
  end
end
