class Compra < ApplicationRecord

  has_many :productos, dependent: :destroy
  accepts_nested_attributes_for :productos, allow_destroy: true, reject_if: proc { |att| att['name'].blank?}

  validate :Validar_fecha
  validates_presence_of :subtotal, message: " No Puede Estar En Blanco"
  validates_presence_of :total, message: " No Puede Estar En Blanco"

  def Validar_fecha

    if Date.parse(fecha.to_s) > Date.today
      errors.add(:fecha," No Puede Estar En El Futuro")
    end
  end
end
