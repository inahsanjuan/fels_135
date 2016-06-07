class LessonsController < ApplicationController
  before_action :load_lesson, only: [:show]
  before_action :logged_in_user, only: [:create]
  def index

  end

  def show
    @words = @lesson.category.words.shuffle
  end

  def create
    @lesson = current_user.lessons.build lesson_params
    @lesson.save
    redirect_to @lesson
  end

  private
  def load_lesson
    @lesson = Lesson.find params[:id]
  end

  def lesson_params
    params.require(:lesson).permit :user_id, :category_id
  end
end
