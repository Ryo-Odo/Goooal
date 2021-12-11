class GoalTagging < ApplicationRecord
  belongs_to :goal
  belongs_to :goal_tag
end
