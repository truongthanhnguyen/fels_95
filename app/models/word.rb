class Word < ActiveRecord::Base
  belongs_to :category
  belongs_to :result
  has_many :answers

  LEARNED_WORDS = "id in (SELECT word_id from results where lesson_id in (
    select id from lessons where user_id = :user_id))"

  scope :all_word_category, ->(category_id){where category_id: category_id}
  scope :learned, ->(user_id){where LEARNED_WORDS, user_id: user_id}
  scope :not_learned, ->(user_id){where.not LEARNED_WORDS, user_id: user_id}

  class << self
    def all_status
      Settings.word.status
    end

    def word_by_filter user_id, category_id, status
      case status
      when Settings.word.all_word
        Word.all_word_category category_id
      when Settings.word.learned_word
        Word.all_word_category(category_id).learned user_id
      else
        Word.all_word_category(category_id).not_learned user_id
      end
    end
  end

  def correct_answer
    answers.find_by correct_answer: true
  end
end
