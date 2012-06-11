class Admin::SettingsController < ApplicationController

  before_filter :authenticate_user!
  
  layout 'admin'
  
  def categories
    @categories = @current_agency.categories.active.includes(:fields)
  end
  
  def fields
    @categories = @current_agency.categories.active
    @fields = @categories.map{|c| c.fields}.flatten.sort{|x,y| x.label <=> y.label}
    @fieldtypes = @current_agency.field_types
  end
end
