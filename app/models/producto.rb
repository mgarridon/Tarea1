class Producto < ApplicationRecord

  #belongs_to :compra

  VALID_NAME_REGEX = /(?=^.{2,50}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/

  validates :nombre, uniqueness: {message: "Ya existe este producto"}, length: { in: 2..50 , :message => "Largo inadecuado de categoria"}, presence: { message: "No Puede Estar En Blanco" }
  validates :precio, presence: {messege: "Debe asignar un precio"}, numericality:{only_integer: true, greater_than_or_equal_to: 1}, length: {in: 1..10, :message =>"Largo inadecuado"}
  validates :precio_compra, presence: {messege: "Debe asignar un precio"}, numericality:{only_integer: true, greater_than_or_equal_to: 1}, length: {in: 1..10, :message =>"Largo inadecuado"}
  validates :marca, length: { in: 2..50 , :message => "Largo inadecuado de marca"},  format: { with: VALID_NAME_REGEX , :message => "Formato invalido"},  presence: { message: "No Puede Estar En Blanco" }
  validates :descripcion, length: { in: 2..50 , :message => "Largo inadecuado de descripcion"},  format: { with: VALID_NAME_REGEX , :message => "Formato invalido"},  presence: { message: "No Puede Estar En Blanco" }


end
