class Categoria < ApplicationRecord
  validates_presence_of :nombre, message: " No Puede Estar En Blanco"
  validates_presence_of :descripcion, message: " No Puede Estar En Blanco"
end
