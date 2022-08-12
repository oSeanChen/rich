class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user, :user_signed_in?

  private
  def record_not_found
    # redirect_to "/"
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    #layout: false 不要再套layout裡面的外殼，並且status 告訴瀏覽器是錯誤404
  end

  def current_user
    # 只撈一次，第二次在看到就給之前撈過的
    # @_user  = @_user || User.find_by(id: session[:user_session])
    @_user ||= User.find_by(id: session[:user_session])
  end

  def user_signed_in?
    #true/false，邏輯短路，前面沒有就不用看後面的資料庫
    session[:user_session] && current_user
  end
  
  def require_login?
    redirect_to sign_in_users_path if not user_signed_in?
  end
end
