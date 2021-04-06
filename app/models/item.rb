class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one    :order
  has_one_attached :image

  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :deliveryprice
  belongs_to :deliveryday

  validates :name, presence: true
  validates :information, presence: true
  validates :itemprice, numericality: { less_than: 9_999_999, greater_than: 299 },
                        format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :deliveryprice_id, numericality: { other_than: 1 }
  validates :deliveryday_id, numericality: { other_than: 1 }
end
