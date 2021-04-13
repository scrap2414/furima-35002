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
        expect(@order_address).to be_valid
      end
      it '建物名が存在しなくても登録できる' do
        @order_address.building =''
        expect(@order_address).to be_valid
      end
      it '電話番号が11文字以下でも登録できる' do
        @order_address.phone_number ='090222111'
        expect(@order_address).to be_valid
      end
    end  
    context '商品購入できないとき' do
      it '不備' do
        @order_address.item_id =''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
