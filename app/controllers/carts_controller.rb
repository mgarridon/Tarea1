class CartsController < ApplicationController
  def show
    @orderes_item = current_order.orderes_item
  end
end
