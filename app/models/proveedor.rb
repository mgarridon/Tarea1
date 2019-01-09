class Proveedor < ApplicationRecord

  validates_uniqueness_of :rut, message: " Actualmente Ingresado"
  validates_presence_of :rut, message: " No Puede Estar En Blanco"
  validates_presence_of :nombre, message: " No Puede Estar En Blanco"
  validates_presence_of :apellido, message: " No Puede Estar En Blanco"
  validates_presence_of :direccion, message: " No Puede Estar En Blanco"
  validates_presence_of :telefono, message: " No Puede Estar En Blanco"
  validates_presence_of :celular, message: " No Puede Estar En Blanco"
  validates_presence_of :nombre_empresa, message: " No Puede Estar En Blanco"

end

