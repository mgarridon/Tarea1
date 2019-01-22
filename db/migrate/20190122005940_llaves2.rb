class Llaves2 < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :carritos, :productos, column: :id_producto, primary_key: :id
    add_foreign_key :carritos, :ventas, column: :id_venta, primary_key: :id
  end
end
