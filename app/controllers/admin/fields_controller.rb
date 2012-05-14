class Admin::FieldsController < ApplicationController

  before_filter :authenticate_user!

  # GET /admin/fields
  # GET /admin/fields.json
  def index
    @admin_fields = Admin::Field.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_fields }
    end
  end

  # GET /admin/fields/1
  # GET /admin/fields/1.json
  def show
    @admin_field = Admin::Field.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_field }
    end
  end

  # GET /admin/fields/new
  # GET /admin/fields/new.json
  def new
    @admin_field = Admin::Field.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_field }
    end
  end

  # GET /admin/fields/1/edit
  def edit
    @admin_field = Admin::Field.find(params[:id])
  end

  # POST /admin/fields
  # POST /admin/fields.json
  def create
    @admin_field = Admin::Field.new(params[:admin_field])

    respond_to do |format|
      if @admin_field.save
        format.html { redirect_to @admin_field, notice: 'Field was successfully created.' }
        format.json { render json: @admin_field, status: :created, location: @admin_field }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/fields/1
  # PUT /admin/fields/1.json
  def update
    @admin_field = Admin::Field.find(params[:id])

    respond_to do |format|
      if @admin_field.update_attributes(params[:admin_field])
        format.html { redirect_to @admin_field, notice: 'Field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/fields/1
  # DELETE /admin/fields/1.json
  def destroy
    @admin_field = Admin::Field.find(params[:id])
    @admin_field.destroy

    respond_to do |format|
      format.html { redirect_to admin_fields_url }
      format.json { head :no_content }
    end
  end
end
