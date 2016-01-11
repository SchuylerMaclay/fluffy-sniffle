class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :name, length: { minimum: 1 }

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :username, length: { minimum: 1 }

  has_many :follower_followships, class_name: "Followship", foreign_key: "followed_id"
  has_many :followed_followships, class_name: "Followship", foreign_key: "follower_id"

  has_many :followers, through: :follower_followships
  has_many :followeds, through: :followed_followships

  has_many :qweets

  def following?(user)
    self.followeds.include?(user)
  end

  def follow(user)
    Relationship.create(follower_id: self.id, followed_id: user.id)
  end
end
