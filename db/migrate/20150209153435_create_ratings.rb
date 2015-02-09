class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :meat_rating
      t.integer :cheese_rating
      t.integer :toppings_rating
      t.integer :bun_rating
      t.integer :user_id
      t.integer :burger_id

      t.timestamps
    end
  end
end
