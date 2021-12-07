class GoalTag < ApplicationRecord
  has_many :goal_taggings, dependent: :destroy
  has_many :goals, through: :goal_taggings, source: :goal
end
