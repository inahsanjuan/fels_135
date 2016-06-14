class Lesson < ActiveRecord::Base
  include CreateActivity

  belongs_to :user
  belongs_to :category
  after_update :create_learned_activities
  after_create :create_learning_activities

  has_many :lesson_words
  has_many :words, through: :lesson_words
  has_many :word_answers, through: :lesson_words
  accepts_nested_attributes_for :lesson_words,
    reject_if: lambda {|attribute| attribute[:word_id].blank?}, allow_destroy: true
  before_create :random_words
  before_update :change_status

  private
  def random_words
    self.words = if category.words.size >= Settings.word_size
      category.words.limit Settings.word_size
    else
      category.words
    end
  end

  def change_status
    self.status = self.status.nil?
  end

  def create_learned_activities
    create_lesson_activities Settings.activity.learned
  end

  def create_learning_activities
    create_lesson_activities Settings.activity.learning
  end
end
