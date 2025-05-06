Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
  resources :posts, only: %i[ index show ]
  resources :users, only: [ :index, :show, :edit, :update ]

  #ログイン中のみ新規ポスト作成、編集、削除が可能
  namespace :users do
    resources :posts, only: %i[ new create edit update destroy ]
  end
end
