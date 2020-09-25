class Flower < ApplicationRecord
  enum color: { red: 0, yellow: 1, blue: 2, pink: 3, orange: 4, mixed: 5 }
  enum occasion: { birthday: 0, bouquet: 1, special_occasion: 2, lux: 3, funeral: 4 }
  enum form: { rounded: 0, piramid: 1, heart: 2 }

  validates :color, presence: true
  validates :occasion, presence: true
  validates :form, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true

  has_many :flower_orders
  has_many :orders, through: :flower_orders

  def increment_ordered_count
    update(ordered_count: ordered_count + 1)
  end
end
