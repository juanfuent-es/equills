
class Admin::ImagesController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_image, only: %i[ show edit update destroy ]
  layout "admin"

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(set_image_params(image_params))
    if image_params[:file].present?
      @image.file = image_params[:file]
    end
    if @image.save
      redirect_to admin_image_path(@image), notice: "La imagen ha sido creada."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # si la imagen cambia, debe reasignarse slug para no dejar cache
    if image_params[:file].present?
      @image.update(file: image_params[:file], slug: @image.safe_title(image_params[:title]))
      @image.file.recreate_versions!
    elsif image_params[:title] != @image.title
      #Si se actualiza el título la imagen se debe reprocesar para coincidir con el título
      @image.update(slug: @image.safe_title(image_params[:title]))
      @image.file.recreate_versions!
    end
    if @image.update(set_image_params(image_params))
      redirect_to "/admin/images", notice: "La imagen #{@image.title} ha sido actualizada."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    redirect_to admin_images_url, notice: "La imagen ha sido eliminada."
  end

  private

    def set_image_params(_params)
      mime, extension = ""
      if _params['file'].present?
        mime = _params['file'].content_type
        extension = mime.split('/')[1]
      else
        extension = @image.extension
        mime = @image.mime_type
      end
      return {
        title: _params['title'],
        alt: _params['alt'],
        bg: _params['bg'],
        color: _params['color'],
        rainbow: _params['rainbow'],
        extension: extension,
        mime_type: mime
      }
    end

    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:title, :file, :alt, :bg, :color, :rainbow)
    end
end
