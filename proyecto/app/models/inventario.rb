class Inventario < ApplicationRecord
  has_many :producto
  has_many :compra
end
