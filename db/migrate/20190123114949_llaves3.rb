class Llaves3 < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :carrito2s, :compras, column: :compra_id, primary_key: :id
    add_foreign_key :carrito2s, :productos, column: :id_producto, primary_key: :id
  end
end
