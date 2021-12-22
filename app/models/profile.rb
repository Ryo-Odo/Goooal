class Profile < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 15 }
  validates :introduction, length: { maximum: 255 }
  belongs_to :user
  mount_uploader :image, ImageUploader
end
