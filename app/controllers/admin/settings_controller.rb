class Admin::SettingsController < ApplicationController

  before_filter :authenticate_user!
  
  layout 'admin'
  
  def index
    @categories = Admin::Category.by_agency(@current_agency.id)
    
  end
  
  def fields
    @fields = Admin::Fields
  end
end
