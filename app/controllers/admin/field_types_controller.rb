class Admin::FieldTypesController < ApplicationController
  # GET /admin/field_types
  # GET /admin/field_types.json
  def index
    @admin_field_types = Admin::FieldType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_field_types }
    end
  end

  # GET /admin/field_types/1
  # GET /admin/field_types/1.json
  def show
    @admin_field_type = Admin::FieldType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_field_type }
    end
  end

  # GET /admin/field_types/new
  # GET /admin/field_types/new.json
  def new
    @admin_field_type = Admin::FieldType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_field_type }
    end
  end

  # GET /admin/field_types/1/edit
  def edit
    @admin_field_type = Admin::FieldType.find(params[:id])
  end

  # POST /admin/field_types
  # POST /admin/field_types.json
  def create
    @admin_field_type = Admin::FieldType.new(params[:admin_field_type])

    respond_to do |format|
      if @admin_field_type.save
        format.html { redirect_to @admin_field_type, notice: 'Field type was successfully created.' }
        format.json { render json: @admin_field_type, status: :created, location: @admin_field_type }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_field_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/field_types/1
  # PUT /admin/field_types/1.json
  def update
    @admin_field_type = Admin::FieldType.find(params[:id])

    respond_to do |format|
      if @admin_field_type.update_attributes(params[:admin_field_type])
        format.html { redirect_to @admin_field_type, notice: 'Field type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_field_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/field_types/1
  # DELETE /admin/field_types/1.json
  def destroy
    @admin_field_type = Admin::FieldType.find(params[:id])
    @admin_field_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_field_types_url }
      format.json { head :no_content }
    end
  end
end
