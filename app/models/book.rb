class Book < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image, dependent: :destroy

  validates :book_name, presence: true
  validates :book_number, presence: true, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
end
