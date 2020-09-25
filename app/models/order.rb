class Order < ApplicationRecord
  has_many :flower_orders
  has_many :flowers, through: :flower_orders

  validate :has_flowers

  def calculate_price
    flowers.map(&:price).inject(0, :+)
  end

  def complete_order
    update(completed: true)
    flowers.each(&:increment_ordered_count)
  end

  private

  def has_flowers
    errors.add(:flowers, "can't be empty") if flowers.empty?
  end
end
