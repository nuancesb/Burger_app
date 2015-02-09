json.array!(@burgers) do |burger|
  json.extract! burger, :id, :name, :price, :profile_picture
  json.url burger_url(burger, format: :json)
end
