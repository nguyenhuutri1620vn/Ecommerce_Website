class AddCartIdToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :cart_id, :bigint
  end
end
