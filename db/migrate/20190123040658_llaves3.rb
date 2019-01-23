class Llaves3 < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :carritos, :compras, column: :compra_id, primary_key: :id
  end
end