class Qweet < ActiveRecord::Base
  validates :content, presence: true
  validates :content, length: { maximum: 256 }
  validates :content, length: { minimum: 1 }
  belongs_to :user
end
