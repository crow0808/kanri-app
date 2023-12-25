class Manual < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :manual_name, presence: true
  validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください' }, allow_blank: true
end
