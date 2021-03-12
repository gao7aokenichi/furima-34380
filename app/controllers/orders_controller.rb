class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item_address = ItemAddress.new
  end

  def create
    binding.pry
    @item_address = ItemAddress.new(item_params)
    if @item_address.valid?
      @item_address.save
      redirect_to root_path
    else
      render :new
    end
  end
end
