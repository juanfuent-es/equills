
class Admin::AssetsController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_asset, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /assets
  def index
    @assets = Asset.all
  end

  # GET /assets/1
  def show
  end

  # GET /assets/new
  def new
    @asset = Asset.new
  end

  # GET /assets/1/edit
  def edit
  end

  # POST /assets
  def create
    @asset = Asset.new(asset_params)
    # @asset = Asset.create({
    #   category: og_params['category'],
    #   extension: mime.split('/')[1],
    #   mime_type: mime
    # })
    # @og.image = og_params['image'] if og_params['image'].present?
    # @og.video = og_params['video'] if og_params['video'].present?
    # @og.audio = og_params['audio'] if og_params['audio'].present?
    if @asset.save
      redirect_to admin_assets_url, notice: "Asset ha sido creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assets/1
  def update
    if @asset.update(asset_params)
      redirect_to admin_assets_url, notice: "Asset ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /assets/1
  def destroy
    @asset.destroy
    redirect_to admin_assets_url, notice: "Asset ha sido eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asset_params
      params.require(:asset).permit(:number, :alt, :img, :video, :audio, :asset_type, :slug, :size)
    end
end
