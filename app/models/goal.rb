class Goal < ApplicationRecord
  validates :goal_title, presence: true, length: { maximum: 45 }
  validates :description, length: { maximum: 255 }
end
