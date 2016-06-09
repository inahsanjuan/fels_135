class FollowersController < ApplicationController
  def index
    @title = t "controllers.users.followers"
    @user  = User.find params[:user_id]
    @users = @user.followers.paginate page: params[:page]
  end
end
