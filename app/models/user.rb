class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_account_name, presence: true, length: { maximum: 15 },
                                format: { with: /\w+/ }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  validates :password, length: { minimum: 6 }, on: :create

  has_many :goals, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :tweets, through: :goals
end
