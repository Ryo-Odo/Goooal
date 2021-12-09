class TweetTagging < ApplicationRecord
  belongs_to :tweet
  belongs_to :tweet_tag
end
