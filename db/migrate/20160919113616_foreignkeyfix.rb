class Foreignkeyfix < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :customers, :orders
  end
end
