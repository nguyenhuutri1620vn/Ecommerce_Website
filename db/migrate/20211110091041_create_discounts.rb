class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.decimal :percent
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
