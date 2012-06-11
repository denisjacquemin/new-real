class Admin::CategoriesController < ApplicationController

  before_filter :authenticate_user!


  # GET /admin/categories/new
  # GET /admin/categories/new.json
  def new
    @category = Admin::Category.new

    respond_to do |format|
      format.html { render :partial => 'new_category', :layout => false }
      format.json { render json: @category }
    end
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = Admin::Category.new(params[:admin_category])
    @category.agency_id = @current_agency.id
    @category.active = true
    

    respond_to do |format|
      if @category.save
        format.html { 
          @categories = @current_agency.categories.active
          render :partial => 'admin/categories/category', :collection => @categories }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @admin_category = Admin::Category.find(params[:id])
    @admin_category.update_attribute(:active, false)
    
    respond_to do |format|
      format.html { redirect_to admin_settings_url }
      format.json { render json: {:id => params[:id]}  }
    end
  end
end
