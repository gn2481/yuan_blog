class AdminsController < ApplicationController
  require 'securerandom'
  def sign_in
    @admin = Admin.new
  end

  def login
    admin = Admin.login(admin_params) # 認證

    if admin
      sign_in_admin(admin)
      redirect_to root_path, notice: '成功登入！'
    else
      redirect_to sign_in_admins_path, notice: '請輸入正確帳號密碼'
    end
  end

  def sign_out
    sign_out_admin
    redirect_to root_path, notice: '會員登出成功'
  end

  private

  def sign_in_admin(a)
    session[:admin_token] = SecureRandom.uuid
  end

  def sign_out_admin
    session[:admin_token] = nil
  end

  def admin_params
    params.require(:admin).permit(:account, :password)
  end
end
