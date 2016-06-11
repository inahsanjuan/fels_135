class Word < ActiveRecord::Base
  belongs_to :category

  has_many :lesson_words, dependent: :destroy
  has_many :word_answers, dependent: :destroy

  accepts_nested_attributes_for :word_answers,
    reject_if: lambda {|attribute| attribute[:content].blank?}, allow_destroy: true
  scope :by_ids, ->ids{where id: ids}
  QUERRY_WORD_LEARNDED = "id in (select lesson_words.word_id from
    lesson_words join lessons on lesson_words.lesson_id = lessons.id
    where lessons.user_id = ?)"
  QUERRY_WORD_NOT_LEARNDED = "id not in (select lesson_words.word_id from
    lesson_words join lessons on lesson_words.lesson_id = lessons.id
    where lessons.user_id = ?)"

  scope :alls, ->user_id{}
  scope :not_learned, ->user_id{where QUERRY_WORD_NOT_LEARNDED, user_id}
  scope :learned, ->user_id{where QUERRY_WORD_LEARNDED, user_id}
  scope :by_category, ->category_id do
    where category_id: category_id if category_id.present?
  end
end
