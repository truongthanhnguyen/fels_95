class Category < ActiveRecord::Base
  has_many :lessons
  has_many :words
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
