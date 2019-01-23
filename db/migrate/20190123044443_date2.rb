class Date2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :compras, :fecha, :date
    add_column :compras, :fecha, :datetime
  end
end
