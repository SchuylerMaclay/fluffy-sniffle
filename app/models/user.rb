class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :name, length: { minimum: 1 }

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :username, length: { minimum: 1 }

  has_many :qweets
end
