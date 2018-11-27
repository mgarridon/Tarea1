class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.integer :fecha
      t.integer :cantidad
      t.integer :subtotal
      t.integer :impuesto
      t.integer :descuento
      t.integer :total
      t.references :proveedor, foreign_key: true

      t.timestamps
    end
  end
end
