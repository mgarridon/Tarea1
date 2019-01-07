class AddPrecioCompraToProducto < ActiveRecord::Migration[5.1]
  def change
    add_column :productos, :precio_compra, :integer
  end
end
