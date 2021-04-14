require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が存在しなくても登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it '電話番号が11文字以下でも登録できる' do
        @order_address.phone_number = '090222111'
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が入力されていない場合購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフン（ー）が入力されていない場合購入できない' do
        @order_address.postal_code = '2230003'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が正しく入力されていない場合購入できない（英字）' do
        @order_address.postal_code = '223-000ww'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が正しく入力されていない場合購入できない（全角）' do
        @order_address.postal_code = '２３４−３３４４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が入力されていない場合購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が入力されていない場合購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が入力されていない場合購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が入力されていない場合購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が正しくされていない場合購入できない（英字）' do
        @order_address.phone_number = '090000299uu'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が正しくされていない場合購入できない（全角）' do
        @order_address.phone_number = '０９０８８７７５５３３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが含まれていない場合購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '商品情報が結びついていない場合購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'ユーザー情報が結びついていない場合購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
