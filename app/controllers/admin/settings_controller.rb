class Admin::SettingsController < ApplicationController

  before_filter :authenticate_user!
  
  layout 'admin'
  
  def categories
    @categories = @current_agency.categories.includes(:fields)
  end
  
  def fields
    @categories = @current_agency.categories
    @fields = @categories.map{|c| c.fields}.flatten
    @fieldtypes = @current_agency.field_types
    
  end
  
  def fieldtypes
    @fieldtypes = @current_agency.field_types
  end
end
