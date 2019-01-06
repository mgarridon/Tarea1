class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:editar,:update, :mostrar, :eliminar]
  def index
    @empleado = Empleado.all
  end

  # Crear nuevo
  def nuevo
    @empleado = Empleado.new
  end
  def crear
    @empleado=Empleado.new(empleado_params)
    respond_to do |format|
      if @empleado.valid?
        if @empleado.save
          format.html { redirect_to @empleado, notice: 'Empleado Creado Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @empleado }
        else
          format.html { render :nuevo }
          format.json { render json: @empleado.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # Mostrar
  def mostrar
  end
  # Actualizar/Editar
  def editar

  end
  def update
    respond_to do |format|
      if @empleado.update(empleado_params)
        format.html{redirect_to update_empleado_path(@empleado), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @empleado.destroy
    flash[:success] = 'Se Borro Con Existo'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to empleados_path}
    end
  end

  private
  # Inicializar Empleado
  def set_empleado
    @empleado = Empleado.find(params[:id])
  end
  # Establecer Parametros
  def empleado_params
    params.require(:empleado).permit(:rut, :nombre, :apellido, :edad, :direccion, :telefono)
  end

end
