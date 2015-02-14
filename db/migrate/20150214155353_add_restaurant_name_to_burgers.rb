class AddRestaurantNameToBurgers < ActiveRecord::Migration
  def change
    add_column :burgers, :restaurant_name, :string
  end
end
