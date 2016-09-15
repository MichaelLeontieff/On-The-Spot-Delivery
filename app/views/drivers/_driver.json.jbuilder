json.extract! driver, :id, :first_name, :last_name, :company_email, :assigned_truck_rego, :created_at, :updated_at
json.url driver_url(driver, format: :json)