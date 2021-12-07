class Profile < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 15 }
  validates :Introduction, length: { maximum: 255 }
  belongs_to :user
end
