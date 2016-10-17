class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :order_id
      t.string :paid

      t.timestamps
    end
  end
end
