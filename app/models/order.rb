class Order < ApplicationRecord
  has_many :flower_orders
  has_many :flowers, through: :flower_orders

  validates :delivery_address, presence: true
  validate :has_flowers

  def calculate_price
    total = 0
    flowers.each do |flower|
      total += flower.price
    end
    total
  end

  def complete_order
    update(completed: true)
    flowers.each do |flower|
      flower.update(ordered_count: flower.ordered_count + 1)
    end
  end

  private

  def has_flowers
    errors.add(:flowers, "can't be empty") if flowers.empty?
  end
end
