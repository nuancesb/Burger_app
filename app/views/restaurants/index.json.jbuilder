json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :postcode, :latitude, :longitude
  json.url restaurant_url(restaurant, format: :json)
end
