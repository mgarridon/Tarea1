class RemoveTotalFacturaIntegerFromFacturaVenta < ActiveRecord::Migration[5.2]
  def change
    remove_column :factura_venta, :total_factura_integer, :string
  end
end
