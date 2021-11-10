class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone, :bigint
    add_column :users, :address, :string
    add_column :users, :role, :boolean
  end
end
