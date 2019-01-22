class AddVentaIdToCarrito < ActiveRecord::Migration[5.1]
  def change
    add_column :carritos, :venta_id, :integer
  end
end
