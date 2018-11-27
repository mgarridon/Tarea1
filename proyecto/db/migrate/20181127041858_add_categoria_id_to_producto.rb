class AddCategoriaIdToProducto < ActiveRecord::Migration[5.2]
  def change
    add_reference :productos, :categoria, foreign_key: true
  end
end
