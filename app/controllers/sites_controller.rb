class SitesController < ApplicationController
  
  layout 'website'

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Admin::Component.page.by_agency(@current_agency.id).by_permalink(params[:permalink])[0]
    raise ActiveRecord::RecordNotFound, 'Page not found' if @page.nil?
    
    @agency = @current_agency
    
    respond_to do |format|
      format.html { render :layout => false}
      format.json { render json: @page }
    end
  end
end
