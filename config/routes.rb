Rails.application.routes.draw do
  # # 之後指定根目錄為貼文首頁
  root 'admin#index'
  # get 'admins/sign_in', to: 'admins#sign_in'
  # post 'admins/sign_in', to: 'admins#login'
  # delete 'admins/sign_out', to: 'admins#sign_out'

  scope controller: :admin do
      get :sign_in
      post :sign_in, to: 'admin#login'
      delete :sign_out
  end
end
