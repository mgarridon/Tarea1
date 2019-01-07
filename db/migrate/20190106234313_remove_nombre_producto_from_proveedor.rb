class RemoveNombreProductoFromProveedor < ActiveRecord::Migration[5.1]
  def change
    remove_column :proveedores, :nombre_producto, :string
  end
end
