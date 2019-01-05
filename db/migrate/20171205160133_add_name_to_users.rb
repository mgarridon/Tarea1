class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_index :users, :name, unique: true
    add_column :users, :type, :string
  end
end