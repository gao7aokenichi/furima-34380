class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item3
  before_action :sold_out_item, only: [:index, :create]

  def index
    @item_address = ItemAddress.new
  end

  def create
    @item_address = ItemAddress.new(item_params)
    if @item_address.valid?
      pay_item
      @item_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item_address).permit(:postal_code, :area_id, :municipality, :address, :building_name,
                                         :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item3
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: item_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if current_user == @item.user || @item.order.present?
    end
end
