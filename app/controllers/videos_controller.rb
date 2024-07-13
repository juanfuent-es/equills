class VideosController < ApplicationController

  before_action :set_video, only: :show

  def sitemap
  end

  def show
    render 'show', formats: [:xml], content_type: 'application/dash+xml'
  end

  private 

  def set_video
    @video = Video.find_by_slug(params[:slug])
  end

end