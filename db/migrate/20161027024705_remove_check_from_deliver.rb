class RemoveCheckFromDeliver < ActiveRecord::Migration[5.0]
  def change
    remove_column :delivers, :package_delivered, :string

  end
end
