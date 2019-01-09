class AddRutToProveedor < ActiveRecord::Migration[5.1]
  def change
    add_column :proveedores, :rut, :string
  end
end
