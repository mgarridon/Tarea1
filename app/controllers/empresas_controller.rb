class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @empresa = Empresa.all
  end

  # Crear nuevo
  def nuevo
    @empresa = Empresa.new
  end
  def crear
    @empresa=Empresa.new(empresa_params)
    respond_to do |format|
      if @empresa.valid?
        if @empresa.save
          format.html { redirect_to @empresa, notice: 'Empresa Creada Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @empresa }
        else
          format.html { render :nuevo }
          format.json { render json: @empresa.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }

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
      if @empresa.update(empresa_params)
        format.html{redirect_to @empresa, notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @empresa.destroy
    flash[:success] = 'Se Borro Con Existo'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to @empresa}
    end
  end

  private
  # Inicializar Chofer
  def set_empresa
    @empresa = Empresa.find(params[:id])
  end
  # Establecer Parametros
  def empresa_params
    params.require(:empresa).permit(:rut, :nombre, :id_ruta)
  end
end

