class Goal < ApplicationRecord
  validates :goal_title, presence: true, length: { maximum: 45 }
  validates :description, length: { maximum: 255 }
  belongs_to :user
  has_many :goal_taggings, dependent: :destroy
  has_many :goal_tags, through: :goal_taggings, source: :goal_tag
  has_many :tweets, dependent: :destroy
end
