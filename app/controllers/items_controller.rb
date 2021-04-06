class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new]
  def index
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
     end
  end



  private

  def item_params
    params.require(:item).permit(:image,:name,:information,:category_id,:status_id,:deliveryprice_id,
      :deliveryday_id,:prefecture_id,:itemprice).merge(user_id: current_user.id)
  end
end
