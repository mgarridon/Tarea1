class Llaves < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :productos, :categorias, column: :id_categoria, primary_key: :id
    add_foreign_key :compras, :proveedores, column: :id_proveedor, primary_key: :id
    add_foreign_key :ventas, :clientes, column: :id_cliente, primary_key: :id
  end
end
