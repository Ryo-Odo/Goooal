class TweetTag < ApplicationRecord
  has_many :tweet_taggings, dependent: :destroy
  has_many :tweets, through: :tweet_taggings, source: :tweet
end
