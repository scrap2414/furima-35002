class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture


  validates :name, presence: true
  validates :information, presence: true
  validates :delivery_price_id, presence: true
  validates :delivery_day_id, presence: true
  validates :item_price, presence: true

  belongs_to :user
  has_one    :order
  has_one_attached :image


  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
end



