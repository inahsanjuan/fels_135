class Admin::UsersController < ApplicationController
  before_action :correct_admin, only: [:destroy]

  def destroy
    if @user.destroy
      flash[:success] = t "admin.deleteuser"
      redirect_to admin_user_path
    else
      flash[:danger] = t "admin.deletefail"
      redirect_to admin_user_path
    end
  end
end
