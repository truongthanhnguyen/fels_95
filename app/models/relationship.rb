class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  after_create :add_follow_activity

  private
  def add_follow_activity
    Activity.create user_id: follower.id, user_name: follower.name,
      content: followed.name, type_content: Settings.activity.RELATIONSHIP_TYPE
  end
end
