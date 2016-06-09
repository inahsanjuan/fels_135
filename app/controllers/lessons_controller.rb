class LessonsController < ApplicationController
  before_action :load_lesson, only: [:show, :update]
  before_action :logged_in_user, only: [:create, :update]
  def index
  end

  def show
    if @lesson.status.present?
      ids = @lesson.lesson_words.map &:word_answer_id
      @word_answers = WordAnswer.eager_load_by_ids(ids)
    end
  end

  def create
    @lesson = current_user.lessons.build lesson_params
    @lesson.save
    redirect_to @lesson
  end

  def update
    if @lesson.update_attributes lesson_params
      redirect_to @lesson
    else
      flash[:danger] = t "views.lessons.fail"
      redirect_to :back
    end
  end

  private
  def load_lesson
    @lesson = Lesson.find params[:id]
  end

  def lesson_params
    params.require(:lesson).permit :user_id, :category_id,
      lesson_words_attributes: [:id, :word_id, :word_answer_id]
  end
end
