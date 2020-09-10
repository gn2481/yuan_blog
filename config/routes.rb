Rails.application.routes.draw do
  # 指定根目錄為貼文首頁
  # root 'post#index'
  root 'admin#index'
  resources :admin, only: [:index] do
    collection do
      get :sign_in # admin/sign_in
      post :login # admin/login
      delete :sign_out # admin/sign_out
    end
  end

  # post
  resources :post
  # profile
  # resources :profile
end
