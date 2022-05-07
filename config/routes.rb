Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  root to: "homes#top"
  devise_for :users

  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # 上記を以下の通り変更
  # onlyオプション：生成するルーティングを限定。不要なルーティングを実行しないようにする。
  resources :books, only:[:index, :show, :edit, :create, :destroy, :update]
  resources :users, only:[:index, :show, :edit, :update]

  get 'homes/about', as: 'about'
end
