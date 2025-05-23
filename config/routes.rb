Rails.application.routes.draw do
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'posts#index'

  # ログイン中のみ新規ポスト作成、編集、削除が可能
  scope module: :users do
    resources :posts, only: %i[new create edit update destroy] do
      member do
        post :reply
      end
    end
    resources :relationships, only: %i[create destroy]
  end

  scope module: :posts do
    resources :favorites, only: %i[create destroy]
  end

  resources :posts, only: %i[index show]
  resources :users, only: %i[index show]
end
