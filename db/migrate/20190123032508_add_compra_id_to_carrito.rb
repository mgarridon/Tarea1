class AddCompraIdToCarrito < ActiveRecord::Migration[5.1]
  def change
    add_column :carritos, :compra_id, :integer
  end
end
