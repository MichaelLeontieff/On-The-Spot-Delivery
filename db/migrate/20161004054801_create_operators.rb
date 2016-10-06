class CreateOperators < ActiveRecord::Migration[5.0]
  def change
    create_table :operators do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_email
      t.string :password_digest

      t.timestamps
    end
  end
end
