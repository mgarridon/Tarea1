class Order < ApplicationRecord

  has_many :orderes_item

  before_save :set_subtotal

  def subtotal
    orderes_item.collect {|order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0}.sum
  end

  private
  def set_subtotal
    self[:subtotal] = subtotal
  end
end
