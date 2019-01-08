class CartsController < ApplicationController
  def show
    @listados = current_orden.listados
  end
end
