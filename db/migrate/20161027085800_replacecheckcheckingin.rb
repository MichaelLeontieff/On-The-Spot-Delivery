class Replacecheckcheckingin < ActiveRecord::Migration[5.0]
  def change
    add_column :checkingins, :checkedin, :string
  end
end
