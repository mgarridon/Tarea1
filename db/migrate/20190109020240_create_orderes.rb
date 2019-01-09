class CreateOrderes < ActiveRecord::Migration[5.1]
  def change
    create_table :orderes do |t|
      t.string :nombre
      t.string :apellido
      t.integer :sub_total

      t.timestamps
    end
  end
end
