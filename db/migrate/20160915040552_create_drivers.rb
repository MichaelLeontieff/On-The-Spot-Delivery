class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_email
      t.string :assigned_truck_rego

      t.timestamps
    end
  end
end
