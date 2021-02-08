class Admin::ItemsController < ApplicationController
  
  def index
  @items = Item.all
     
  end
  
  def new
   @item = Item.new
   @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def item_params
   
   params.permit(:name,:image_id,:genre_id,:introduction,:price)
   
  end
  
end
