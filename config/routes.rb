Rails.application.routes.draw do
  # # 之後指定根目錄為貼文首頁
  root 'admins#index'

  resource :admins, except:[:new, :create] do
    collection do
      get :sign_in
      post :sign_in, to: 'admins#login'
      delete :sign_out
    end
  end

  resources :posts
end
