require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it '全ての入力項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '価格設定が半角数字であれば出品できる' do
        @item.itemprice = 8000
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it '商品カテゴリが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態が空では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料負担が空では出品できない' do
        @item.deliveryprice_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliveryprice must be other than 1')
      end
      it '配送地域が空では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送日数が空では出品できない' do
        @item.deliveryday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliveryday must be other than 1')
      end
      it '販売価格が空では出品できない' do
        @item.itemprice = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Itemprice is invalid')
      end
      it '販売価格が半角数字でなければ出品できない（英語）' do
        @item.itemprice = 'ten'
        @item.valid?
        expect(@item.errors.full_messages).to include('Itemprice is not a number')
      end
      it '販売価格が半角数字でなければ出品できない（ひらがな）' do
        @item.itemprice = 'じゅう'
        @item.valid?
        expect(@item.errors.full_messages).to include('Itemprice is not a number')
      end
      it '販売価格が半角数字でなければ出品できない（カタカナ）' do
        @item.itemprice = 'ヒャクエン'
        @item.valid?
        expect(@item.errors.full_messages).to include('Itemprice is not a number')
      end
      it '販売価格が半角数字でなければ出品できない（漢字）' do
        @item.itemprice = '五百円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Itemprice is not a number')
      end

      it '販売価格が適正でなければ出品できない（下方）' do
        @item.itemprice = 220
        @item.valid?
        expect(@item.errors.full_messages).to include('Itemprice must be greater than 299')
      end
      it '販売価格が半角数字でなければ出品できない（上方）' do
        @item.itemprice = 200000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Itemprice must be less than 9999999')
      end

      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'ユーザー情報が紐付いてないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
