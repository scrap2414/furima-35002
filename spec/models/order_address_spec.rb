require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全ての入力項目が存在すれば登録できる' do
      end
    end
  


  
    context '商品購入できないとき' do
      it '不備' do
      end
    end
    
  end
end
