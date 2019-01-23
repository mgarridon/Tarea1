class CreateCarrito2s < ActiveRecord::Migration[5.1]
  def change
    create_table :carrito2s do |t|
      t.integer :cantidad
      t.integer :precio_act
      t.integer :id_producto
      t.integer :compra_id

      t.timestamps
    end
  end
end
