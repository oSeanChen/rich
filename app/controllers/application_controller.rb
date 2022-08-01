class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  private
  def record_not_found
    # redirect_to "/"
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    #layout: false 不要再套layout裡面的外殼，並且status 告訴瀏覽器是錯誤404
  end
end
