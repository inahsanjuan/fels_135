class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def correct_admin
    unless current_user.admin?
      flash[:danger] = I18n.t "admin.correct"
      redirect_to root_url
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = I18n.t "admin.calllogin"
      redirect_to login_url
    end
  end
end
