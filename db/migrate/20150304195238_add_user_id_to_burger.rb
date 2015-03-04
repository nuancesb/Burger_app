class AddUserIdToBurger < ActiveRecord::Migration
  def change
    add_column :burgers, :user_id, :integer
  end
end
