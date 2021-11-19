class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.bigint :category_id
      t.string :name
      t.decimal :price
      t.string :description
      t.string :image_path
      t.boolean :status
      t.integer :quantity
      t.bigint :discount_id

      t.timestamps
    end
  end
end
