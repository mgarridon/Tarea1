class Producto < ApplicationRecord

  has_many :listados

  validates_presence_of :nombre, message: " No Puede Estar En Blanco"
  validates_presence_of :precio, message: " No Puede Estar En Blanco"
  validates_presence_of :precio_compra, message: " No Puede Estar En Blanco"
  validates_presence_of :marca, message: " No Puede Estar En Blanco"
  validates_presence_of :descripcion, message: " No Puede Estar En Blanco"

end
