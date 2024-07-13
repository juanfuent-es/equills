class LegalsController < ApplicationController

  def terms
    case @lang
    when "en"
      @page = Page.find_by_slug('terms-and-conditions')
    else
      @page = Page.find_by_slug('terminos-y-condiciones')
    end
    register_visit(@page) if @page
  end

  def privacy
    case @lang
    when "en"
      @page = Page.find_by_slug('privacy-policy')
    else
      @page = Page.find_by_slug('aviso-de-privacidad')
    end
    register_visit(@page) if @page
  end
  
  def cookies
    case @lang
    when "en"
      @page = Page.find_by_slug('cookies-policy')
    else
      @page = Page.find_by_slug('aviso-de-cookies')
    end
    register_visit(@page) if @page
  end

end