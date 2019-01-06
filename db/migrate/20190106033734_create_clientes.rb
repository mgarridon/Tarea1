class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.string :rut
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.integer :telefono

      t.timestamps
    end
  end
end
