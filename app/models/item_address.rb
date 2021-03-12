class ItemAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number

  # with_options presence: true do
  #   validates :user_id
  #   validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  # end
  # validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address,
                   building_name: building_name, phone_number: phone_number, order: order)
  end
end
