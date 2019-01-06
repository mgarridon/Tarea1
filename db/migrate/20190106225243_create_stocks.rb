class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.date :fecha_vencimiento
      t.integer :id_compra
      t.integer :id_producto
      t.integer :id_venta

      t.timestamps
    end
  end
end
