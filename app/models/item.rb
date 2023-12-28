class Item < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image, dependent: :destroy
end
