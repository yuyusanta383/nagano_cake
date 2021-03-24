class Admin::ItemsController < ApplicationController
  
  def index
  @items = Item.all
  @genres = Genre.all
  end
  
  def new
   @item = Item.new
   @items = Item.all
   @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
     redirect_to :action => 'index'
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def update
   @item = Item.find(params[:id])
   @item.update(item_params)
   redirect_to admin_items_path(@item.id)
   
  end
  
  private
  
  
  def item_params
   
   params.require(:item).permit(:name, :image, :genre_id, :introduction, :price, :is_active)
   
  end
  
end
