class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :municipality
    validates :house_number
    validates :item_id
    validates :user_id
    validates :phone_number,format: { with: /\A[0-9]+\z/ }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end

