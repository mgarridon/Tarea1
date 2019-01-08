class Otrasllaves < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :orderes_item, :productos, column: :product_id, primary_key: :id
    add_foreign_key :orderes_item, :orderes, column: :order_id, primary_key: :id
  end
end
