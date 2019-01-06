class CreateEmpleados < ActiveRecord::Migration[5.1]
  def change
    create_table :empleados do |t|
      t.string :rut
      t.string :nombre
      t.string :apellido
      t.integer :edad
      t.string :direccion
      t.integer :telefono

      t.timestamps
    end
  end
end
