class Admin::ThemesController < ApplicationController
  
  before_filter :authenticate_user!
  
  layout 'admin'

  def index
    @themes = Admin::Theme.by_agency(@current_agency.id)
  end

  def show
    @theme = Admin::Theme.find(params[:id])
    session[:theme_id] = params[:id]
    prepare_sidebar
  end
end
