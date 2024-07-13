class LetrismsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_letrism, only: %i[ show edit update destroy ]

  # GET /letrisms
  def index
    @letrisms = Letrism.all.shuffle.take(6)
		@equill = Equill.active.shuffle.first
  end

  # GET /letrisms/1
  def show
    @letrism = Letrism.find_by_slug(params[:id])
  end

  # GET /letrisms/new
  def new
    if params[:id]
			@equill = Equill.find_by_slug(params[:id])
			@letrism = Letrism.new(equill_id: @equill.id)
		else
			redirect_to "/"
		end
  end

  # POST /letrisms
  def create
    @letrism = Letrism.new(letrism_params)
    @letrism.user_id = current_user.id
    if @letrism.save
      redirect_to letrism_path(id: @letrism.slug), notice: "El letrismo ha sido creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /letrisms/1
  def update
    if @letrism.update(letrism_params)
      redirect_to admin_letrisms_url, notice: "Letrism ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /letrisms/1
  def destroy
    @letrism.destroy
    redirect_to admin_letrisms_url, notice: "Letrism ha sido eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letrism
      @letrism = Letrism.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def letrism_params
      params.require(:letrism).permit(:equill_id, :chars, :slug, :paths, :img, :bg, :fill, :stroke, :gallery)
    end

end