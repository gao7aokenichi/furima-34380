class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
       @items = Item.all
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    # item.create(item_params)
    end
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :charge_id, :image, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
