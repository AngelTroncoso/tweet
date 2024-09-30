class NuevosController < ApplicationController
  before_action :set_nuevo, only: %i[ show edit update destroy ]

# controladores/nuevos_controller.rb
def index
  @nuevos = Nuevo.paginate(page: params[:page], per_page: 10)

  if params[:buscar].present?
    @nuevos = Nuevo.search(params[:buscar]).paginate(page: params[:page], per_page: 10)
  end
end
  # GET /nuevos/1 or /nuevos/1.json
  def show
  end

  # GET /nuevos/new
  def new
    @nuevo = Nuevo.new
  end

  # GET /nuevos/1/edit
  def edit
  end

  # POST /nuevos or /nuevos.json
  def create
    @nuevo = Nuevo.new(nuevo_params)

    respond_to do |format|
      if @nuevo.save
        format.html { redirect_to @nuevo, notice: "Nuevo was successfully created." }
        format.json { render :show, status: :created, location: @nuevo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nuevo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nuevos/1 or /nuevos/1.json
  def update
    respond_to do |format|
      if @nuevo.update(nuevo_params)
        format.html { redirect_to @nuevo, notice: "Nuevo was successfully updated." }
        format.json { render :show, status: :ok, location: @nuevo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nuevo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuevos/1 or /nuevos/1.json
  def destroy
    @nuevo.destroy!

    respond_to do |format|
      format.html { redirect_to nuevos_path, status: :see_other, notice: "Nuevo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nuevo
      @nuevo = Nuevo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nuevo_params
      params.require(:nuevo).permit(:description, :username)
    end
end
