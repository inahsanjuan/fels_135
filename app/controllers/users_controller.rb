class UsersController < ApplicationController

  def new
  end

  def show
  end

  def edit
  end

  def update
    if current_user.update_attributes user_params
      flash[:success ] = t "profileupdated"
      redirect_to current_user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
