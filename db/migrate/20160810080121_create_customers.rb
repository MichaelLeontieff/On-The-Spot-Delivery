class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :card_no
      t.string :card_type
      t.string :ccv
      t.string :card_expiry
      t.string :street
      t.string :suburb
      t.string :postcode
      t.string :city
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
