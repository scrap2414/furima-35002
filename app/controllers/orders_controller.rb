class OrdersController < ApplicationController

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
    Payjp.api_key = "sk_test_8b364a99642d0606dcb17395"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: item[:itemprice],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


end
