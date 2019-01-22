class VentasController < ApplicationController
  before_action :set_venta, only: [:editar,:update, :mostrar, :eliminar]
  def index
    @venta = Venta.all
    @clientes = Cliente.all
    @empleados = Empleado.all
    @productos = Producto.all
  end

  # Crear nuevo
  def nuevo
    @venta = Venta.new
    @clientes = Cliente.all
    @empleados = Empleado.all
    @productos = Producto.all
  end
  def crear
    @clientes = Cliente.all
    @empleados = Empleado.all
    @productos = Producto.all
    @venta = Venta.new(venta_params)
    fecha_actual = DateTime.now
    @venta.fecha= fecha_actual
    if @venta.save
      #Venta correctamente hecha
      # Captura del id de la venta recien hecha
      @venta_recien_hecha = Venta.select("id").where("fecha = ?", fecha_actual)
      #Captura de los productos asociados a la venta recien hecha
      @productos_comprados = Carrito.select("id_producto, cantidad, precio_act, id").where("venta_id = ?", @venta_recien_hecha[0].id)
      #Actualizacion de stock para cada producto seleccionado
      @productos_comprados.each do |producto|
        #Captura del stock actual del producto
        @datos_productos = Producto.select("cantidad, nombre, precio").where("id = ?", producto.id_producto)
        #Captura de la cantidad comprada
        nuevo_stock = @datos_productos[0].cantidad.to_i - producto.cantidad
        product = Producto.find(producto.id_producto.to_i)
        product.update_attribute :cantidad, nuevo_stock.to_s

        if nuevo_stock < 5
          flash[:danger] = "Producto: "+@datos_productos[0].nombre.to_s+" tiene stock bajo: "+nuevo_stock.to_s
        end
      end
      flash[:success] = "Se ha realizado la venta"
      redirect_to ventas_path
    else
      flash[:danger] = "Ha ocurrido un error"
      render nueva_venta_path
    end
  end

  # Mostrar
  def mostrar
  end
  # Actualizar/Editar
  def editar
    @clientes = Cliente.all
    @empleados = Empleado.all
    @productos = Producto.all
  end
  def update
    respond_to do |format|
      if @venta.update(venta_params)
        format.html{redirect_to update_venta_path(@venta), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @venta.destroy
    flash[:success] = 'Se Borró Con Éxito'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to ventas_path}
    end
  end

  private
  # Inicializar Venta
  def set_venta
    @venta = Venta.find(params[:id])
  end
  # Establecer Parametros
  def venta_params
    params.require(:venta).permit(:fecha, carritos_attributes: [:id ,:id_producto, :cantidad, :precio_act] )
  end

end
