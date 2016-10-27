class RemoveCheckFromCheckin < ActiveRecord::Migration[5.0]
  def change
    remove_column :checkingins, :checked_in, :string

  end
end
