class Categorias2Controller < ApplicationController
  before_action :set_categoria2, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @categoria = Categoria.all
  end

  # Crear nuevo
  def nuevo
    @categoria = Categoria.new
  end
  def crear
    @categoria = Categoria.new(categoria_params)
    respond_to do |format|
      if @categoria.valid?
        if @categoria.save
          format.html { redirect_to categoria2_url(@categoria), notice: 'Categoria Creada Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @categoria }
        else
          format.html { render :nuevo }
          format.json { render json: @categoria.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
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
      if @categoria.update(categoria_params)
        format.html{redirect_to update_categoria2_path(@categoria), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @categoria.destroy
      flash[:success] = 'Se Borro Con Exito'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
    end
    respond_to do |format|
      format.html {redirect_to categorias2_path}
    end
  end

  private
  # Inicializar categoria
  def set_categoria2
    @categoria = Categoria.find(params[:id])
  end
  # Establecer Parametros
  def categoria_params
    params.require(:categoria).permit(:descripcion,:nombre)
  end
end
