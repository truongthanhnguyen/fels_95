class Word < ActiveRecord::Base
  belongs_to :category
  belongs_to :result
end
