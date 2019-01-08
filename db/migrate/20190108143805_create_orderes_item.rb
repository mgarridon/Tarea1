class CreateOrderesItem < ActiveRecord::Migration[5.1]
  def change
    create_table :orderes_item do |t|
      t.integer :product_id
      t.integer :order_id
      t.float :unit_price
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
