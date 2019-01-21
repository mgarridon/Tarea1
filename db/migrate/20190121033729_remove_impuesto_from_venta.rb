class RemoveImpuestoFromVenta < ActiveRecord::Migration[5.1]
  def change
    remove_column :ventas, :impuesto, :integer
  end
end
