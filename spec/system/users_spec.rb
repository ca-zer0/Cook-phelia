require 'rails_helper'

RSpec.describe "user新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
    driven_by(:selenium_chrome_headless)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('Sign up')
      visit new_user_registration_path
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { User.count }.by(1)
      expect(page).to have_current_path(recipes_path)
      find('.header-nav-btn').click
      expect(page).to have_selector('a', text: 'ログアウト', visible: :all)
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('Sign up')
      visit new_user_registration_path
      fill_in 'Name', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { User.count }.by(0)
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_current_path(recipes_path)
      find('.header-nav-btn').click
      expect(page).to have_selector('a', text: 'ログアウト', visible: :all)
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      find('input[name="commit"]').click
      expect(page).to have_current_path(root_path)
    end
  end
end