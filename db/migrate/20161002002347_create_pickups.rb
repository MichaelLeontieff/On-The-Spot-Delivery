class CreatePickups < ActiveRecord::Migration[5.0]
  def change
    create_table :pickups do |t|
      t.integer :order_id
      t.string :collected
      t.string :signature
      t.string :charge

      t.timestamps
    end
  end
end
