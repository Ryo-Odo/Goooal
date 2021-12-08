class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :goal
end
