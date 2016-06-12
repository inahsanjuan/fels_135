class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_admin
  before_action :load_category, only: [:create]
  before_action :load_word, except: [:index, :new, :create]

  def show
    @word = Word.find params[:id]
    @word_answers = @word.word_answers
  end

  def new
    @word = Word.new
    Settings.build_word_answer.times {@word.word_answers.build}
  end

  def create
    @word = @category.words.new word_params
    if @word.save
      flash[:success] = t "admin.addsuccess"
      redirect_to admin_category_path(@category)
    else
      flash[:danger] = t "admin.addfail"
      render :new
    end
  end

  def destroy
    if @word.destroy
      flash[:success] = t "admin.deleted"
    else
      flash[:danger] = t "deletefail"
    end
    redirect_to :back
  end

  def edit
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = t "admin.wordupdated"
      redirect_to :back
    else
      flash[:danger] = t "admin.updatefail"
      render :edit
    end
  end

  private
  def word_params
    params.require(:word).permit :content, :category_id,
      word_answers_attributes: [:id, :content, :correct_answer]
  end

  def load_category
    @category = Category.find params[:category_id]
  end

  def load_word
    @word = Word.find params[:id]
  end
end
