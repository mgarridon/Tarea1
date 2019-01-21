class RemoveImpuestoFromCompra < ActiveRecord::Migration[5.1]
  def change
    remove_column :compras, :impuesto, :integer
  end
end
