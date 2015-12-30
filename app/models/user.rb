class User < ActiveRecord::Base
  has_many :lessons
  has_many :activities
  has_many :active_follows, class_name: Relationship.name
    foreign_key: "follower_id", depedent: :destroy
  has_many :passive_follows, class_name: Relationship.name
    foreign_key: "followed_id", depedent: :destroy
  has_many :followeds, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower 
end
																																																																	