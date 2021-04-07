class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :deliveryprice
  belongs_to :deliveryday

  with_options presence: true do
    validates :name
    validates :information
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :prefecture_id
      validates :deliveryprice_id
      validates :deliveryday_id
    end
    with_options numericality: { less_than: 9_999_999, greater_than: 299 },
                 format: { with: /\A[0-9]+\z/ } do
      validates :itemprice
    end
  end
end
