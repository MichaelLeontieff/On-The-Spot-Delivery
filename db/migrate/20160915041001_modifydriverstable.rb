class Modifydriverstable < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :password_digest, :string
  end
end
