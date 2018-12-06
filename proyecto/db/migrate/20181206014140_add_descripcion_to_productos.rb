class AddDescripcionToProductos < ActiveRecord::Migration[5.2]
  def change
    add_column :productos, :descripcion, :string
  end
end
