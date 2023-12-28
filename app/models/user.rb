class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :manuals
  has_many :books
  has_many :items

  validates :name, presence: true
  validates :password, format: { with: /\A[0-9a-zA-Z]+\z/, message: 'は半角英数字のみ使用できます' }
end
