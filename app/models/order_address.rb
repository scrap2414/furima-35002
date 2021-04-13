class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, 
  :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipality
    validates :house_number
    validates :item_id
    validates :user_id
    validates :phone_number,format: { with: /\A[0-9]+\z/ }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, 
      house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end

