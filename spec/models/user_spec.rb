require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "正常に登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上あれば登録できる" do
        @user.password = 'test123'
        @user.password_confirmation = 'test123'
        expect(@user).to be_valid
      end
    end

    context '新規登録出来ない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("doesn't match Password")
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password ='11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordとconfirmが一致していないと登録できない' do
        @user.password = 'test12345'
        @user.password_confirmation ='test98765'
        @user.valid?
        expect(@user.errors.full_messages).to include("doesn't match Password")
      end
      it 'passwordが英数字混合でも6文字未満なら登録できない' do
        @user.password ='test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("is too short (minimum is 6 characters)")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('has already been taken')
      end
      it 'emailには@が含まれていないと登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('is invalid')
      end
    end
  end
end