Rails.application.routes.draw do
  devise_scope :user do
    root "users/sessions#new"
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions'
  }

  resources :recipes
  resources :lists, param: :recipe_id, only: [:index, :create, :destroy] do
    get 'check/:recipe_id', to: 'lists#check', as: 'check', on: :collection
  end
end
