class CreateCheckingins < ActiveRecord::Migration[5.0]
  def change
    create_table :checkingins do |t|
      t.integer :order_id
      t.string :checked_in

      t.timestamps
    end
  end
end
