class CreateVenta < ActiveRecord::Migration[5.2]
  def change
    create_table :venta do |t|
      t.integer :cantidad
      t.integer :subtotal
      t.integer :descuento
      t.integer :impuesto
      t.integer :total
      t.references :cliente, foreign_key: true
      t.references :producto, foreign_key: true
      t.references :empleado, foreign_key: true

      t.timestamps
    end
  end
end
