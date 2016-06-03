class Word < ActiveRecord::Base
  belongs_to :category

  has_many :lesson_words, dependent: :destroy
  has_many :word_answers, dependent: :destroy

  accepts_nested_attributes_for :word_answers,
    reject_if: lambda {|attribute| attribute[:word_id].blank?}, allow_destroy: true
end
