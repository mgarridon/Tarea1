class Datetodatetime < ActiveRecord::Migration[5.1]
  def change
    remove_column :ventas, :fecha, :date
    add_column :ventas, :fecha, :datetime
  end
end