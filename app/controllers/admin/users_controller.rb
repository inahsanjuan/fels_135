class Admin::UsersController < ApplicationController
  before_action :correct_admin, only: [:destroy]
  before_action :load_user, only: [:destroy]
  def destroy
    if @user.destroy
      flash[:success] = t "admin.deleteuser"
      redirect_to users_path
    else
      flash[:danger] = t "admin.deletefail"
      redirect_to :back
    end
  end

  private
  def load_user
    @user = User.find params[:id]
  end
end
