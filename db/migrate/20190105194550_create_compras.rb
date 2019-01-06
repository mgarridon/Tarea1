class CreateCompras < ActiveRecord::Migration[5.1]
  def change
    create_table :compras do |t|
      t.integer :fecha
      t.integer :cantidad
      t.date :fecha
      t.integer :cantidad
      t.integer :subtotal
      t.integer :impuesto
      t.integer :total
      t.integer :id_proveedor

      t.timestamps
    end
  end
end
