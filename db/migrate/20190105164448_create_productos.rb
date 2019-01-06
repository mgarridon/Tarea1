class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :precio
      t.string :marca
      t.string :descripcion
      t.integer :id_categoria

      t.timestamps
    end
  end
end
