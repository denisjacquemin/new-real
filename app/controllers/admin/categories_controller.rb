class Admin::CategoriesController < ApplicationController

  before_filter :authenticate_user!

  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @admin_categories = Admin::Category.by_agency(@current_agency)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_categories }
    end
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
    @admin_category = Admin::Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_category }
    end
  end

  # GET /admin/categories/new
  # GET /admin/categories/new.json
  def new
    @category = Admin::Category.new

    respond_to do |format|
      format.html { render :partial => 'new_category', :layout => false }
      format.json { render json: @category }
    end
  end

  # GET /admin/categories/1/edit
  def edit
    @admin_category = Admin::Category.find(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = Admin::Category.new(params[:admin_category])
    @category.agency_id = @current_agency.id
    

    respond_to do |format|
      if @category.save
        format.html { 
          @categories = Admin::Category.by_agency(@current_agency)
          render :partial => 'admin/categories/category', :collection => @categories }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/categories/1
  # PUT /admin/categories/1.json
  def update
    @admin_category = Admin::Category.find(params[:id])

    respond_to do |format|
      if @admin_category.update_attributes(params[:admin_category])
        format.html { redirect_to @admin_category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @admin_category = Admin::Category.find(params[:id])
    @admin_category.destroy

    respond_to do |format|
      format.html { redirect_to admin_settings_url }
      format.json { render json: {:id => params[:id]}  }
    end
  end
end
