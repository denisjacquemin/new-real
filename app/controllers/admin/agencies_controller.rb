class Admin::AgenciesController < ApplicationController
  
  before_filter :authenticate_user!
  
  layout 'admin'
  
  # GET /admin/agencies
  # GET /admin/agencies.json
  def index
    @admin_agencies = Admin::Agency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_agencies }
    end
  end

  # GET /admin/agencies/1
  # GET /admin/agencies/1.json
  def show
    @admin_agency = Admin::Agency.where(:id => params[:id]).includes(:pages)[0]
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_agency }
    end
  end

  # GET /admin/agencies/new
  # GET /admin/agencies/new.json
  def new
    @admin_agency = Admin::Agency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_agency }
    end
  end

  # GET /admin/agencies/1/edit
  def edit
    @admin_agency = Admin::Agency.find(params[:id])
  end

  # POST /admin/agencies
  # POST /admin/agencies.json
  def create
    @admin_agency = Admin::Agency.new(params[:admin_agency])

    respond_to do |format|
      if @admin_agency.save
        format.html { redirect_to @admin_agency, notice: 'Agency was successfully created.' }
        format.json { render json: @admin_agency, status: :created, location: @admin_agency }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/agencies/1
  # PUT /admin/agencies/1.json
  def update
    @admin_agency = Admin::Agency.find(params[:id])

    respond_to do |format|
      if @admin_agency.update_attributes(params[:admin_agency])
        format.html { redirect_to @admin_agency, notice: 'Agency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/agencies/1
  # DELETE /admin/agencies/1.json
  def destroy
    @admin_agency = Admin::Agency.find(params[:id])
    @admin_agency.destroy

    respond_to do |format|
      format.html { redirect_to admin_agencies_url }
      format.json { head :no_content }
    end
  end
end
