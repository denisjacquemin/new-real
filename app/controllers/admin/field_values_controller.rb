class Admin::FieldValuesController < ApplicationController
  # GET /admin/field_values
  # GET /admin/field_values.json
  def index
    @admin_field_values = Admin::FieldValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_field_values }
    end
  end

  # GET /admin/field_values/1
  # GET /admin/field_values/1.json
  def show
    @admin_field_value = Admin::FieldValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_field_value }
    end
  end

  # GET /admin/field_values/new
  # GET /admin/field_values/new.json
  def new
    @admin_field_value = Admin::FieldValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_field_value }
    end
  end

  # GET /admin/field_values/1/edit
  def edit
    @admin_field_value = Admin::FieldValue.find(params[:id])
  end

  # POST /admin/field_values
  # POST /admin/field_values.json
  def create
    @admin_field_value = Admin::FieldValue.new(params[:admin_field_value])

    respond_to do |format|
      if @admin_field_value.save
        format.html { redirect_to @admin_field_value, notice: 'Field value was successfully created.' }
        format.json { render json: @admin_field_value, status: :created, location: @admin_field_value }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_field_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/field_values/1
  # PUT /admin/field_values/1.json
  def update
    @admin_field_value = Admin::FieldValue.find(params[:id])

    respond_to do |format|
      if @admin_field_value.update_attributes(params[:admin_field_value])
        format.html { redirect_to @admin_field_value, notice: 'Field value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_field_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/field_values/1
  # DELETE /admin/field_values/1.json
  def destroy
    @admin_field_value = Admin::FieldValue.find(params[:id])
    @admin_field_value.destroy

    respond_to do |format|
      format.html { redirect_to admin_field_values_url }
      format.json { head :no_content }
    end
  end
end
