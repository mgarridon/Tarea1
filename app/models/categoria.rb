class Categoria < ApplicationRecord

  VALID_NAME_REGEX = /(?=^.{2,50}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/

  validates :nombre, uniqueness: {message: "Ya existe esta categoria"}, length: { in: 2..50 , :message => "Largo inadecuado de categoria"},  format: { with: VALID_NAME_REGEX , :message => "Formato invalido"},  presence: { message: "No Puede Estar En Blanco" }
  validates :descripcion, length: { in: 2..50 , :message => "Largo inadecuado de categoria"},  format: { with: VALID_NAME_REGEX , :message => "Formato invalido"},  presence: { message: "No Puede Estar En Blanco" }
end
