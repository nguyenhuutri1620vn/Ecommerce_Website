class RemoveUsertoCart < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :user_id, :bigint
  end
end
