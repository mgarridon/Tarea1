class CreateVenta < ActiveRecord::Migration[5.2]
  def change
    create_table :venta do |t|
      t.references :empleado, foreign_key: true
      t.references :cliente, foreign_key: true
      t.integer :cantidad
      t.integer :subtotal
      t.integer :descuento
      t.integer :impuesto
      t.integer :total

      t.timestamps
    end
  end
end
