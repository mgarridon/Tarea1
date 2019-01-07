class WelcomeController < ApplicationController
  def index
    cliente = Cliente.all.size
    producto= Producto.all.size
    venta = Venta.all.size
    proveedor = Proveedor.all.size

    @datos = [cliente,producto,venta,proveedor]

  end
end
