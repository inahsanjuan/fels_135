class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word_answer
  belongs_to :word

  scope :correct_answers, -> do
    joins(:word_answer).where word_answers:{correct_answer: true}
  end
end
