class SetupForeignKey < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :user_id, :customer_id
  end
end
