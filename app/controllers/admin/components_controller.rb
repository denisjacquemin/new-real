class Admin::ComponentsController < ApplicationController

  before_filter :authenticate_user!

  layout 'admin'

  # GET /admin/components/new
  # GET /admin/components/new.json
  def new
    @component = Admin::Component.new
    @component.component_type_id = params[:type]
    @component.theme_id = params[:theme]
    
    prepare_sidebar

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_component }
    end
  end

  # GET /admin/components/1/edit
  def edit
    @component = Admin::Component.find(params[:id])
    
    prepare_sidebar
  end

  # POST /admin/components
  # POST /admin/components.json
  def create
    @component = Admin::Component.new(params[:admin_component])

    respond_to do |format|
      if @component.save
        format.html { redirect_to edit_admin_component_path(@component), notice: 'Component was successfully created.' }
        format.json { render json: @component, status: :created, location: @component }
      else
        format.html { render action: "new" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/components/1
  # PUT /admin/components/1.json
  def update
    @component = Admin::Component.find(params[:id])

    respond_to do |format|
      if @component.update_attributes(params[:admin_component])
        format.html { redirect_to edit_admin_component_path(@component), notice: 'Component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/components/1
  # DELETE /admin/components/1.json
  def destroy
    @component = Admin::Component.find(params[:id])
    @component.destroy

    respond_to do |format|
      format.html { redirect_to admin_themes_show_url }
      format.json { head :no_content }
    end
  end
end
