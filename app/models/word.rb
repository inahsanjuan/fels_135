class Word < ActiveRecord::Base
  belongs_to :category

  has_many :lesson_words, dependent: :destroy
  has_many :word_answers, dependent: :destroy
end
