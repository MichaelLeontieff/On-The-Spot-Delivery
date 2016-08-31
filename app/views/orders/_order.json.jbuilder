json.extract! order, :id, :user_id, :no_packages, :gross_weight, :pickup_time, :destination_address_one, :destination_address_two, :created_at, :updated_at
json.url order_url(order, format: :json)