class CreateCarritos < ActiveRecord::Migration[5.1]
  def change
    create_table :carritos do |t|
      t.integer :cantidad
      t.integer :precio_act
      t.integer :id_producto
      t.integer :venta_id

      t.timestamps
    end
  end
end
