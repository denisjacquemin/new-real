class Admin::SettingsController < ApplicationController

  before_filter :authenticate_user!
  
  layout 'admin'
  
  def categories
    @categories = @current_agency.categories.includes(:fields)
    
  end
  
  def fields
    @categories = @current_agency.categories
    @fields = @categories.map{|c| c.fields}.flatten
    
  end
  
  def field_types
    @fields_types = @current_Agency.field_types
  end
end
