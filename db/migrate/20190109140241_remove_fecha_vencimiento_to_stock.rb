class RemoveFechaVencimientoToStock < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :fecha_vencimiento, :date
  end
end
