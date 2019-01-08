class CreateListados < ActiveRecord::Migration[5.1]
  def change
    create_table :listados do |t|
      t.integer :id_producto
      t.integer :id_orden
      t.float :precio_unico
      t.integer :cantidad
      t.float :precio_total

      t.timestamps
    end
  end
end
