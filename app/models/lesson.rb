class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :lesson_words

  accepts_nested_attributes_for :lesson_words,
    reject_if: lambda {|attribute| attribute[:word_id].blank?}, allow_destroy: true
  before_create :random_words

  private
  def random_words
    self.category.words = if category.words.size >= Settings.word_size
      category.words.limit Settings.word_size
    else
      category.words
    end
  end
end
