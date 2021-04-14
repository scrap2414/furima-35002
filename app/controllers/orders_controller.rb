class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :my_item, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if  @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end



  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, 
      :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: item[:itemprice],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def my_item
    @item = Item.find(params[:item_id])
    redirect_to root_path  if current_user.id == @item.user_id
  end
end
