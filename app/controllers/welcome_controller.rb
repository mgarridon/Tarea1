class WelcomeController < ApplicationController
  def index
    cliente = Cliente.all.size
    producto= Producto.all.size
    venta = Venta.all.size
    compra = Compra.all.size

    @datos = [cliente,producto,venta,compra]

  end
end
