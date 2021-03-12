class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #  has_one : order
  belongs_to :user
  has_one_attached :image
  belongs_to :area
  belongs_to :charge
  belongs_to :status
  belongs_to :category
  belongs_to :day
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :charge_id
      validates :area_id
      validates :day_id
    end
  end
end
