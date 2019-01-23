class Compra < ApplicationRecord

  has_many :carritos
  accepts_nested_attributes_for :carritos

  validates_presence_of :id_proveedor, message: " No Puede Estar En Blanco"
  validate :Validar_fecha


  def Validar_fecha

    if Date.parse(fecha.to_s) > DateTime.now
      errors.add(:fecha," No Puede Estar En El Futuro")
    end
  end
end
