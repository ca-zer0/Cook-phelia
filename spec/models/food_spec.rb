require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = FactoryBot.build(:food)
  end

  describe '食材新規登録' do
    context '新規登録できる場合' do
      it "正常に登録できる" do
        expect(@food).to be_valid
      end
    end

    context '新規登録出来ない時' do
      it 'nameが空では登録できない' do
        @food.name = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("食材名が空白です")
      end

      it 'amountが空では登録できない' do
        @food.amount = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("食材の量が空白です")
      end

      it 'unitが空では登録できない' do
        @food.unit = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("食材の単位が空白です")
      end

      it 'amountが全角数字では登録できない' do
        @food.amount = '５'
        @food.valid?
        expect(@food.errors.full_messages).to include("食材の量は半角数字で入力してください")
      end

      it 'recipeが紐づいていない場合は登録できない' do
        @food.recipe = nil
        @food.valid?
        expect(@food.errors.full_messages).to include('must exist')
      end
    end
  end

end
