class RemovePickupCheck < ActiveRecord::Migration[5.0]
  def change
    remove_column :pickups, :collected, :string
  end
end
