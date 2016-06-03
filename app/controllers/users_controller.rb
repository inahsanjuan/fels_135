class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
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
