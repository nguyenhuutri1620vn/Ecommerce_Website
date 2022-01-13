class AddUserToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :user_id, :bigint
  end
end
