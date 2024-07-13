
class Admin::VideosController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_video, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /videos
  def index
    @videos = Video.all
  end

  # GET /videos/1
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    redirect_to admin_video_path(@video)
  end

  # POST /videos
  def create
    video = FFMPEG::Movie.new(video_params['file'])
    @video = Video.create(title: video_params['title'], width: video.width, height: video.height)
    @video.file = video_params['file'] if video_params['file'].present?
    if @video.save
      redirect_to admin_video_path(@video), notice: "El video ha sido creado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1
  def update
    redirect_to admin_video_path(@video)
  end

  # DELETE /videos/1
  def destroy
    @video.destroy
    redirect_to videos_url, notice: "El video ha sido eliminado"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:file, :title)
    end

end