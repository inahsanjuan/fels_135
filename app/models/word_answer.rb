class WordAnswer < ActiveRecord::Base
  belongs_to :word

  has_many :lesson_words, dependent: :destroy

  scope :eager_load_by_ids, ->(ids) do
    eager_load(word: :word_answers).where id: ids
  end

end
