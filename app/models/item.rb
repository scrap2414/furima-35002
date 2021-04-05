class Item < ApplicationRecord
  validates :name, presence: true
  validates :information, presence: true
  validates :category_id , presence: true
  validates :status_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_price_id, presence: true
  validates :delivery_day_id, presence: true
  validates :item_price, presence: true

  belongs_to :user
  has_one    :order
  has_one_attached :image
end



