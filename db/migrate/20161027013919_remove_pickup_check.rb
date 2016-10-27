class RemovePickupCheck < ActiveRecord::Migration[5.0]
  def change
    remove_column :Pickups, :collected, :string
  end
end
