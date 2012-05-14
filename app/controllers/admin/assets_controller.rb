class Admin::AssetsController < ApplicationController
  
  before_filter :authenticate_user!
  
  layout 'admin'

  def new
    prepare_sidebar
  end
  
  def index
     prepare_sidebar
     
     @assets = Admin::Asset.all
     
     respond_to do |format|
       format.json {  
         render :json => @assets.collect { |p| p.to_jq_upload }.to_json
       }
     end
   end

  def create
    p_attr = params[:admin_asset]
    p_attr[:file] = params[:admin_asset][:file].first if params[:admin_asset][:file].class == Array
  
    @asset = Admin::Asset.new(p_attr)
    if @asset.save
      respond_to do |format|
        format.html {  
          render :json => [@asset.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@asset.to_jq_upload].to_json			
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @asset = Admin::Asset.find(params[:id])
    @asset.destroy
    render :json => true
  end
end
