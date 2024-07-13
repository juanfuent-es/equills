class BlogController < ApplicationController
  before_action :set_page, only: [:show, :like]

  def index
    if params[:tag]
      @pages = Page.where(published: true).tagged_with(params[:tag]).limit(10).page(params[:page])
    else
      @pages = Page.where(published: true).limit(10).page(params[:page])
    end
  end

  def show
    register_visit(@page) if @page
  end

  def like
    @like = @page.likes.where(visitor_id: current_visitor.id).first_or_create!
    @like.update(count: @like.count + 1)
  end

  private
  
    def set_page
      @page = Page.find_by_slug(params[:id])
    end

end