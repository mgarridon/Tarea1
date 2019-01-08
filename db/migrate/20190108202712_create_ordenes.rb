class CreateOrdenes < ActiveRecord::Migration[5.1]
  def change
    create_table :ordenes do |t|
      t.float :subtotal
      t.float :total
      t.float :impuesto
      t.float :envio

      t.timestamps
    end
  end
end
