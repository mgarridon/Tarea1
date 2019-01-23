class CreateVentas < ActiveRecord::Migration[5.1]
  def change
    create_table :ventas do |t|
      t.date :fecha
      t.integer :id_cliente

      t.timestamps
    end
  end
end
