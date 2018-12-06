class RemoveDescripcionFromProductos < ActiveRecord::Migration[5.2]
  def change
    remove_column :productos, :descripcion, :integer
  end
end
