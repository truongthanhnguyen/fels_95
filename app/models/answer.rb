class Answer < ActiveRecord::Base
  belongs_to :word
  belongs_to :result
end
