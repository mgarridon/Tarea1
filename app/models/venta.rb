class Venta < ApplicationRecord
  has_many :carritos
  accepts_nested_attributes_for :carritos

  validate :Validar_fecha

  def Validar_fecha

    if Date.parse(fecha.to_s) > Date.today
      errors.add(:fecha," No Puede Estar En El Futuro")
    end
  end
end
