class ChangeCartIdToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column :order_details, :cart_id, :bigint
  end
end
