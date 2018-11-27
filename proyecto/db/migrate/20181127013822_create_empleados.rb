class CreateEmpleados < ActiveRecord::Migration[5.2]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.string :sexo
      t.integer :fecha_nac
      t.string :direccion
      t.integer :telefono

      t.timestamps
    end
  end
end
