require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
  end

  describe 'レシピ新規登録' do
    context '新規登録できる場合' do
      it "正常に登録できる" do
        expect(@recipe).to be_valid
      end
    end

    context '新規登録出来ない時' do
      it 'nameが空では登録できない' do
        @recipe.name = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("料理名が空白です")
      end

      it 'category_idが空では登録できない' do
        @recipe.category_id = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("カテゴリーが空白です")
      end

      it 'kondate_idが空では登録できない' do
        @recipe.kondate_id = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("献立が空白です")
      end

      it 'peopleが空では登録できない' do
        @recipe.people = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("何人前かが空白です")
      end

      it "imageがない場合は登録できないこと" do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("画像は必須です")
      end

      it 'category_idが"---"では登録できない' do
        @recipe.category_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("カテゴリーが空白です")
      end

      it 'kondate_idが"---"では登録できない' do
        @recipe.kondate_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("献立が空白です")
      end

      it 'userが紐づいていない場合は登録できない' do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('User must exist')
      end
    end
  end

end
