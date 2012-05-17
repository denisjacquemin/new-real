class Admin::SettingsController < ApplicationController

  before_filter :authenticate_user!
  
  layout 'admin'
  
  def categories
    @categories = Admin::Category.by_agency(@current_agency.id)
    
  end
  
  def fields
    @fields = Admin::Category.by_agency(@current_agency.id).map{|c| c.fields}
  end
end
