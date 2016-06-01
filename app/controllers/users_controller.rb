class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = I18n.t "controllers.create"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update_attributes user_params
      flash[:success ] = I18n.t "users.profileupdated"
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
