class AddTokenToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orderes, :token, :string
  end
end
