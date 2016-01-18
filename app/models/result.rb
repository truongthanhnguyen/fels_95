class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  has_many :words
  has_many :answers
end
