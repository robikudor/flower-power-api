require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "must have at least one flower" do
    order = Order.new(delivery_address: 'Mars')

    assert_not order.save
  end

  test "must have an address assigned" do
    order = Order.new
    order.flower_ids = [Flower.first.id]

    assert_not order.save
  end

  test "when attributes are correct" do
    order = Order.new(delivery_address: 'Mars')
    order.flower_ids = [Flower.first.id]

    assert order.save
  end

  test "order cost is calculated" do
    order = Order.new

    order.flower_ids = [Flower.first.id, Flower.last.id]

    assert_equal(Flower.first.price + Flower.last.price, order.calculate_price)
  end

  test "finish order updates completed field" do
    order = Order.new(delivery_address: 'Mars')
    order.flower_ids = [Flower.first.id]

    order.complete_order

    assert order.completed
  end

  test "finish order updates ordered count on flowers" do
    order = Order.new(delivery_address: 'Mars')
    order.flower_ids = [Flower.first.id]

    order.complete_order

    assert_equal(1, Flower.first.ordered_count)
  end
end
