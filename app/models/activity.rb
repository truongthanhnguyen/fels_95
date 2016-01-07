class Activity < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.length_activity.maximum}
end
