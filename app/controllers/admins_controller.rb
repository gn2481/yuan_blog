class AdminsController < ApplicationController
  require 'securerandom'
  def show
    @admin = current_admin
  end
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
    redirect_to root_path, notice: '成功登出'
  end

  def edit
    @admin = current_admin
  end

  def update
    admin = current_admin
    if admin.update(admin_params)
      redirect_to root_path, notice: '資料更新成功'
    else
      render :edit
    end
  end


  private

  def sign_in_admin(a)
    session[:admin_token] = SecureRandom.uuid
    a.update(token: session[:admin_token])
  end

  def sign_out_admin
    session[:admin_token] = nil
  end

  def admin_params
    params.require(:admin).permit(:account, :password, :avatar, :experience, :email, :introduction)
  end
end
