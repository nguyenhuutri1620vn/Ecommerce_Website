class RemoveCartsColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :quantity
    remove_column :carts, :product_id
    remove_column :carts,  :user_id
  end
end
