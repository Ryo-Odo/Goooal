class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :goal
  has_many :tweet_taggings, dependent: :destroy
  has_many :tweet_tags, through: :tweet_taggings, source: :tweet_tag
  has_many :comments, dependent: :destroy
end
