class FollowingController < ApplicationController
  def index
    @title = t "controllers.users.following"
    @user = User.find params[:user_id]
    @users = @user.following.paginate page: params[:page]
  end
end
