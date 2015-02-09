class CreateBurgers < ActiveRecord::Migration
  def change
    create_table :burgers do |t|
      t.string :name
      t.float :price
      t.string :profile_picture

      t.timestamps
    end
  end
end
