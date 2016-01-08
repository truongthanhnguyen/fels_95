class Activity < ActiveRecord::Base
  FOLLOWING_IDS = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
  FOLLOWING_QUERY = "user_id IN (#{FOLLOWING_IDS}) OR user_id = :user_id"

  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.length_activity.maximum}

  scope :feed, ->(user_id){where FOLLOWING_QUERY, user_id: user_id}
end
