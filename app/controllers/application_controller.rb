class ApplicationController < ActionController::Base
  private

  def admin_signed_in?
    current_admin != nil
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_token])
    # 若不加@，效能較差，因為每次都要去資料庫找
    # 加了之後因為用 ||=，指定一次之後，第二次之後就不需要再去找資料庫
  end

  def authenticate_admin!
    redirect_to root_path, notice: '權限不足' unless admin_signed_in?
  end
end
