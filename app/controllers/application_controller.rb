class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_agency

  def prepare_sidebar
    @theme = Admin::Theme.find(params[:theme]) if @theme.nil?
    @templates = @theme.templates
    @pages = @theme.pages
    @stylesheets = @theme.stylesheets
    @javascripts = @theme.javascripts
    @assets = @theme.assets
  end

  private

  def current_agency
    @current_agency = Admin::Agency.find_by_domain(request.host)
  end

end
