class CreateDelivers < ActiveRecord::Migration[5.0]
  def change
    create_table :delivers do |t|
      t.integer :order_id
      t.string :package_delivered
      t.string :signature

      t.timestamps
    end
  end
end
