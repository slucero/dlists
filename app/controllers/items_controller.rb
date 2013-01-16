class ItemsController < ApplicationController
  before_filter :load_list

  # GET /list/1/items
  # GET /list/1/items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /list/1/items/1
  # GET /list/1/items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /list/1/items/new
  # GET /list/1/items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /list/1/items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /list/1/items
  # POST /list/1/items.json
  def create
    @item = Item.new(params[:item])
    @item.list = @list

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_item_path(@list, @item), notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: list_item_path(@list, @item) }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /list/1/items/1
  # PUT /list/1/items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to list_item_path(@list, @item), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list/1/items/1
  # DELETE /list/1/items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @list }
      format.json { head :no_content }
    end
  end

  # POST /list/1/items/sort
  def sort
    @items = @list.items

    @items.each do |item|
      item.set_list_position(params[:item].index(item.id.to_s) + 1)
      item.save()
    end

    render :nothing => true
  end

  private

  def load_list
    @list = List.find(params[:list_id])
  end
end
