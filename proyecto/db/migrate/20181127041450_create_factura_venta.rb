class CreateFacturaVenta < ActiveRecord::Migration[5.2]
  def change
    create_table :factura_venta do |t|
      t.references :venta, foreign_key: true
      t.integer :num_empleado
      t.string :total_factura_integer

      t.timestamps
    end
  end
end
