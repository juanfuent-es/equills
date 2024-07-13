class StaticController < ApplicationController
  around_action :get_lang

  def page
    @pages = Page.where(lang: @lang)
    slug = params[:slug] ? params[:slug] : @lang
    @page = @pages.find_by_slug(slug)
    render_not_found if @page.nil?
  end

end