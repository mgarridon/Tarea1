class AddPrecioTotalToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :orderes_item, :precio_total, :float
  end
end
