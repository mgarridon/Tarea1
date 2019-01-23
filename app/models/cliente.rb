class Cliente < ApplicationRecord

  VALID_NAME_REGEX = /(?=^.{2,50}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/

  validates_uniqueness_of :rut, message: " Actualmente Ingresado"
  validates_presence_of :rut, message: " No Puede Estar En Blanco"
  validates :nombre, length: { in: 2..50 , :message => "Largo inadecuado de categoria"},  format: { with: VALID_NAME_REGEX , :message => "Formato invalido"},  presence: { message: "No Puede Estar En Blanco" }
  validates :apellido, length: { in: 2..50 , :message => "Largo inadecuado de categoria"},  format: { with: VALID_NAME_REGEX , :message => "Formato invalido"},  presence: { message: "No Puede Estar En Blanco" }
  validates_presence_of :direccion, length: { in: 2..50 , :message => "Largo inadecuado de categoria"}, message: " No Puede Estar En Blanco"
  validates :telefono, presence: {messege: "Debe asignar un teléfono"}, numericality:{only_integer: true}, length: {in: 8..9, :message =>"Largo inadecuado"}

end
