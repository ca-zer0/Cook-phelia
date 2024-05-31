require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = FactoryBot.build(:list)
  end

  describe '食材新規登録' do
    context '新規登録できる場合' do
      it "正常に登録できる" do
        expect(@list).to be_valid
      end
    end

    context '新規登録出来ない時' do
      it 'recipeが紐づいていない場合は登録できない' do
        @list.recipe = nil
        @list.valid?
        expect(@list.errors.full_messages).to include('must exist')
      end

      it 'userが紐づいていない場合は登録できない' do
        @list.user = nil
        @list.valid?
        expect(@list.errors.full_messages).to include('must exist')
      end
    end
  end
end
