class ComprasController < ApplicationController
  before_action :set_compra, only: [:editar,:update, :mostrar, :eliminar]
  def index
    @compra = Compra.all
    @proveedores = Proveedor.all
    @productos = Producto.all
  end

  # Crear nuevo
  def nuevo
    @proveedores = Proveedor.all
    @compra = Compra.new
    @productos = Producto.all
  end
  def crear
    @proveedores = Proveedor.all
    @productos = Producto.all
    @compra=Compra.new(compra_params)
    fecha_actual = DateTime.now
    @compra.fecha= fecha_actual
    if @compra.save
      #Compra correctamente hecha
      # Captura del id de la compra recien hecha
      @compra_recien_hecha = Compra.select("id").where("fecha = ?", fecha_actual)
      #Captura de los productos asociados a la compra recien hecha
      @productos_comprados = Carrito.select("id_producto, cantidad, precio_act, id").where("compra_id = ?", @compra_recien_hecha[0].id)
      #Actualizacion de stock para cada producto seleccionado
      @productos_comprados.each do |producto|
        #Captura del stock actual del producto
        @datos_productos = Producto.select("cantidad, nombre, precio").where("id = ?", producto.id_producto)
        #Captura de la cantidad comprada
        nuevo_stock = @datos_productos[0].cantidad.to_i + producto.cantidad
        product = Producto.find(producto.id_producto.to_i)
        product.update_attribute :cantidad, nuevo_stock.to_s

        if nuevo_stock < 5
          flash[:danger] = "Producto: "+@datos_productos[0].nombre.to_s+" tiene stock bajo: "+nuevo_stock.to_s
        end
      end
      flash[:success] = "Se ha realizado la compra"
      redirect_to compra_path(@compra_recien_hecha[0].id)
    else
      flash[:danger] = "Ha ocurrido un error"
      render nueva_compra_path
    end
  end

  # Mostrar
  def mostrar
    @id_compra = params[:id]
    @proveedor = Compra.select("id_proveedor").where("id = ?",@id_compra)
    @descripcionCompra = Carrito.select("id_producto, cantidad, precio_act").where("compra_id = ?", @id_compra)
    @productos = Producto.select("id, nombre")
    @CostoTotal = 0
    respond_to do |format|
      format.html
      format.pdf {render template: 'compras/boleta', pdf: 'Boleta_de_Compra ', page_size: 'A4', orientation: 'Landscape'}
    end
  end
  # Actualizar/Editar
  def editar
    @proveedores = Proveedor.all
    @productos = Producto.all
  end
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html{redirect_to update_compra_path(@compra), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @compra.destroy
    flash[:success] = 'Se Borró Con Éxito'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to compras_path}
    end
  end

  private
  # Inicializar Compra
  def set_compra
    @compra = Compra.find(params[:id])
  end
  # Establecer Parametros
  def compra_params
    params.require(:compra).permit(:id_proveedor, :fecha, carritos_attributes: [:id ,:id_producto, :cantidad, :precio_act])
  end

end
