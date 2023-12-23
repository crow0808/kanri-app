class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users

  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数字のみ使用できます' }

  validates :name, presence: true
end
