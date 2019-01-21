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
    @venta=Venta.new(venta_params)
    respond_to do |format|
      if @venta.valid?
        if @venta.save
          format.html { redirect_to @venta, notice: 'Venta Creada Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @venta }
        else
          format.html { render :nuevo }
          format.json { render json: @venta.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
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
    params.require(:venta).permit(:fecha, :cantidad, :subtotal,:total, :id_cliente, :id_empleado, :id_producto )
  end

end
