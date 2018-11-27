class AddProductoIdToVenta < ActiveRecord::Migration[5.2]
  def change
    add_reference :venta, :producto, foreign_key: true
  end
end
