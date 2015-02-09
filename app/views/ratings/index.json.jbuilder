json.array!(@ratings) do |rating|
  json.extract! rating, :id, :meat_rating, :cheese_rating, :toppings_rating, :bun_rating, :user_id, :burger_id
  json.url rating_url(rating, format: :json)
end
