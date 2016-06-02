class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_admin, except: [:show, :index]
  before_action :load_category, only: [:show, :edit, :update]

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @words = @category.words.paginate page: params[:page]
  end

  def edit
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "controllers.admin.messages"
      redirect_to admin_root_url
    else
      flash[:danger] = t "controllers.admin.messages_2"
      render :new
    end
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
