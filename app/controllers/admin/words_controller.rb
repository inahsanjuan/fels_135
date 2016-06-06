class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_admin
  before_action :load_category, only: [:create]

  def show
    @word = Word.find params[:id]
    @word_answers = @word.word_answers
  end

  def new
    @word = Word.new
    3.times {@word.word_answers.build}
  end

  def create
    @word = @category.words.new word_params
    if @word.save
      flash[:success] = I18n.t "admin.addsuccess"
      redirect_to root_path
    else
      flash[:danger] = I18n.t "admin.addfail"
      render :new
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
end
