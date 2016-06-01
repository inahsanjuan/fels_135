class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :index]
  before_action :load_category, only: [:show, :edit, :update]
  before_action :correct_admin, only: [:edit, :update, :destroy]
  def index
    @categories = Category.paginate page: params[:page]
  end

  def show

  end

  def edit

  end

  def update
    if @category.update_attributes category_params
      flash[:success] = I18n.t "admin.categoryupdated"
      redirect_to admin_category_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = I18n.t "admin.deletecategory"
      redirect_to admin_categories_path
    end
  end

  private
  def load_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit :name
  end
end
