class ItemAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :phone_number, length: { maximum: 11 }
    validates :phone_number, numericality: { message: 'cannot be registered with mixed alphanumeric characters' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address,
                   building_name: building_name, phone_number: phone_number, order: order)
  end
end
