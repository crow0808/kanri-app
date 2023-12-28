class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :manuals, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :items, dependent: :destroy

  validates :room_name,     presence: true, uniqueness: { scope: :room_password, message: 'とこのパスコードの組み合わせはすでに存在します' }
  validates :room_password, presence: true, format: { with: /\A\d{4}\z/, message: 'は4文字の半角数字で入力してください' }, uniqueness: { scope: :room_name }
end
