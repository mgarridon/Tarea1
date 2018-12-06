class AddTotalFacturaToFacturaVenta < ActiveRecord::Migration[5.2]
  def change
    add_column :factura_venta, :total_factura, :integer
  end
end
