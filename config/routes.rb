Rails.application.routes.draw do
  # 指定根目錄為貼文首頁
  root 'post#index'

  resources :admin do
    collection do
      get :sing_in # user/sign_in
      post :login
      post :edit
      patch :update
    end
  end

  # post
  resources :post
  # profile
  # resources :profile
end
