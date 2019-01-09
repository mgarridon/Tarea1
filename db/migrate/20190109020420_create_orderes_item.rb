class CreateOrderesItem < ActiveRecord::Migration[5.1]
  def change
    create_table :orderes_item do |t|
      t.integer :producto_id
      t.integer :order_id
      t.integer :cantidad
      t.integer :precio

      t.timestamps
    end
  end
end
