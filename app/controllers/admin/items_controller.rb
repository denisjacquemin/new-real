class Admin::ItemsController < ApplicationController
  
  before_filter :authenticate_user!

  layout 'admin'
  
  # GET /admin/items
  # GET /admin/items.json
  def index
    @items = Admin::Item.by_agency(@current_agency.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_items }
    end
  end

  # GET /admin/items/1
  # GET /admin/items/1.json
  def show
    @admin_item = Admin::Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_item }
    end
  end

  # GET /admin/items/new
  # GET /admin/items/new.json
  def new
    @admin_item = Admin::Item.new
    @type_id = params[:type]
    
    @categories = @current_agency.categories.includes(:fields)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_item }
    end
  end

  # GET /admin/items/1/edit
  def edit
    @admin_item = Admin::Item.find(params[:id])
    @categories = @admin_item.field_values.collect do |fv| 
      fv.category
    end
    
  end

  # POST /admin/items
  # POST /admin/items.json
  def create
    @admin_item = Admin::Item.new(params[:admin_item])
    @admin_item.agency_id = @current_agency.id
    fields = params[:item][:field]

    respond_to do |format|
      if @admin_item.save
               
        fields.each do |key, value|
          Admin::FieldValue.create(:item_id => @admin_item.id, :field_id => key, :value => value)
        end
        
        format.html { redirect_to edit_admin_item_path(@admin_item), notice: 'Item was successfully created.' }
        format.json { render json: @admin_item, status: :created, location: @admin_item }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/items/1
  # PUT /admin/items/1.json
  def update
    @admin_item = Admin::Item.find(params[:id])
    fields = params[:item][:field]

    respond_to do |format|
      if @admin_item.update_attributes(params[:admin_item])
        
        fields.each do |key, value|
          Admin::FieldValue.create(:item_id => @admin_item.id, :field_id => key, :value => value)
        end
        
        format.html { redirect_to @admin_item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/items/1
  # DELETE /admin/items/1.json
  def destroy
    @admin_item = Admin::Item.find(params[:id])
    @admin_item.destroy

    respond_to do |format|
      format.html { redirect_to admin_items_url }
      format.json { head :no_content }
    end
  end
end
