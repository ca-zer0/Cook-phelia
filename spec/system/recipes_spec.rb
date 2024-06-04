require 'rails_helper'

RSpec.describe 'レシピ追加', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category, name: 'Category Name')
    @kondate = FactoryBot.create(:kondate, name: 'Kondate Name')
    @recipe = FactoryBot.build(:recipe, category_id: @category.id, kondate_id: @kondate.id, user: @user)
    @food = FactoryBot.build(:food)
  end

  context 'レシピ追加ができるとき' do
    it 'ログインしたユーザーはレシピ追加できる' do
      visit root_path

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_current_path(recipes_path)

      expect(page).to have_content('マイレシピを追加する')

      visit new_recipe_path

      fill_in 'recipe_name', with: @recipe.name # 正しいフィールド名またはIDを指定
      select 'Category Name', from: 'recipe[category_id]' # カテゴリーを選択
      select 'Kondate Name', from: 'recipe[kondate_id]' # 構成を選択
      fill_in 'food-people', with: @recipe.people
      fill_in 'food-name', with: @food.name
      fill_in 'food-amount', with: @food.amount
      fill_in 'food-unit', with: @food.unit

      attach_file('recipe-image', Rails.root.join('spec/fixtures/test_image.png'))

      find('input[type="submit"][value="追加する"]').click

      expect {
        find('input[name="commit"]').click
      }.to change { Recipe.count }.by(1)

      expect(page).to have_selector("img[src*='test_image.png']")

      expect(page).to have_content(@recipe.name)
    end
  end

  context 'レシピ追加ができないとき' do
    it 'ログインしていないとレシピ追加ページにアクセスできない' do
      # ログインページにリダイレクトされることを確認する
      visit new_recipe_path
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'ログインせずに始めるをクリックしrecipes_pathに遷移したあと、レシピを追加ボタンをクリックするとroot_pathに戻る' do
      # トップページにアクセス
      visit root_path

      # ログインせずに始めるをクリック
      click_link 'ログインせずに始める'
      
      # recipes_pathに遷移したことを確認
      expect(page).to have_current_path(recipes_path)

      # レシピ追加ボタンをクリック
      click_link 'マイレシピを追加する' # ボタンのテキストを適宜調整

      # root_pathにリダイレクトされることを確認
      expect(page).to have_current_path(new_user_session_path)
    end

    it '誤った情報ではレシピを追加できずにレシピ追加ページへ戻ってくる' do
      visit root_path

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_current_path(recipes_path)

      expect(page).to have_content('マイレシピを追加する')

      visit new_recipe_path

      fill_in 'recipe_name', with: ''
      select '---', from: 'recipe[category_id]'
      select '---', from: 'recipe[kondate_id]'
      fill_in 'food-people', with: ''
      fill_in 'food-name', with: ''
      fill_in 'food-amount', with: ''
      fill_in 'food-unit', with: ''

      attach_file('recipe-image', Rails.root.join('spec/fixtures/test_image.png'))

      find('input[type="submit"][value="追加する"]').click

      expect(page).to have_current_path(new_recipe_path)

      expect {
        find('input[name="commit"]').click
      }.to change { Recipe.count }.by(0)
    end
  end
end

RSpec.describe 'レシピ編集', type: :system do
  before do
    @recipe1 = FactoryBot.create(:recipe)
    @recipe2 = FactoryBot.create(:recipe)
  end
  context 'レシピ編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したレシピの編集ができる' do
    end
  end
  context 'レシピ編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したレシピの編集画面には遷移できない' do
    end
    it 'ログインしていないとレシピの編集画面には遷移できない' do
    end
  end
end