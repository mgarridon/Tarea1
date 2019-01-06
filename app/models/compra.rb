class Compra < ApplicationRecord
  validate :Validar_fecha
  validates_presence_of :cantidad, message: " No Puede Estar En Blanco"
  validates_presence_of :subtotal, message: " No Puede Estar En Blanco"
  validates_presence_of :impuesto, message: " No Puede Estar En Blanco"
  validates_presence_of :total, message: " No Puede Estar En Blanco"
  validates_presence_of :id_proveedor, message: " No Puede Estar En Blanco"




  def Validar_fecha

    if Date.parse(fecha.to_s) > Date.today
      errors.add(:fecha," No Puede Estar En El Futuro")
    end
  end
end
