Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ルートパスを設定
  root to: 'items#index'
  # indexアクションを実行するようなルーティングを追記
  resources :items, only: [:index, :new, :create]
end
