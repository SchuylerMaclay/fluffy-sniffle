class User < ActiveRecord::Base
  # validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { minimum: 3 }

  has_many :qweets
end
