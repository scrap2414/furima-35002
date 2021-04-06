require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字の混合であれば登録できる' do
        @user.password = '000xxx'
        @user.password_confirmation = '000xxx'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000xxx'
        @user.password_confirmation = '000xxx'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'harukaze'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが全角では登録できない' do
        @user.password = '３３３ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英語と数字の両方を含めて設定してください')
      end
      it 'password:半角英数字混合（数字のみ）' do
        @user.password = '222333'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英語と数字の両方を含めて設定してください')
      end
      it 'password:半角英数字混合（英字のみ）' do
        @user.password = 'xxxyyy'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英語と数字の両方を含めて設定してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000xx'
        @user.password_confirmation = '000xx'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'ユーザー名が空では登録できない（名字）' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name は全角文字を使用してください')
      end
      it 'ユーザー名が空では登録できない（名前）' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name は全角文字を使用してください')
      end
      it 'ユーザー名が半角では登録できない（名字）' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角文字を使用してください')
      end
      it 'ユーザー名が半角では登録できない（名前）' do
        @user.last_name = 'xyz'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角文字を使用してください')
      end
      it 'ユーザー名(カナ）が空では登録できない（名字）' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana はカタカナを使用してください')
      end
      it 'ユーザー名（カナ）が空では登録できない（名前）' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana はカタカナを使用してください')
      end
      it 'ユーザー名(カナ）が半角では登録できない（名字）' do
        @user.first_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナを使用してください')
      end
      it 'ユーザー名（カナ）が半角では登録できない（名前）' do
        @user.last_name_kana = 'xyz'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana はカタカナを使用してください')
      end
      it 'ユーザー名(カナ）が数字では登録できない（名字）' do
        @user.first_name_kana = '２３２'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナを使用してください')
      end
      it 'ユーザー名（カナ）が数字では登録できない（名前）' do
        @user.last_name_kana = '２２５'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana はカタカナを使用してください')
      end
      it 'ユーザー名(カナ）がひらがなでは登録できない（名字）' do
        @user.first_name_kana = 'はる'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナを使用してください')
      end
      it 'ユーザー名（カナ）がひらがなでは登録できない（名前）' do
        @user.last_name_kana = 'かぜ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana はカタカナを使用してください')
      end
      it 'ユーザー名(カナ）が漢字では登録できない（名字）' do
        @user.first_name_kana = '春'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナを使用してください')
      end
      it 'ユーザー名（カナ）が漢字では登録できない（名前）' do
        @user.last_name_kana = '風'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana はカタカナを使用してください')
      end
      it '生年月日が空ではでは登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
