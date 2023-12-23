class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users

  validates :room_name,     presence: true
  validates :room_password, presence: true, format: { with: /\A\d{4}\z/, message: 'は4文字の半角数字で入力してください' }
end
