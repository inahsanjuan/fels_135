class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def correct_admin
    unless current_user.admin?
      flash[:danger] = I18n.t "admin.correct"
      redirect_to root_url
    end
  end
end
