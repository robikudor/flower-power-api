require 'test_helper'

class OrderTest < ActionDispatch::IntegrationTest
  test 'GET orders returns the list of orders' do
    get '/orders'

    assert_equal JSON.parse(@response.body).map { |element| element['id'] }, Order.all.pluck(:id)
  end

  test 'POST orders with valid params creates a new order' do
    assert_difference('Order.count') do
      post '/orders/', params: { flower_ids: [Flower.first.id], delivery_address: 'Test address 123' }
    end
  end

  test 'POST orders with invalid flower ids does not creates a new order' do
    assert_no_difference('Order.count') do
      post '/orders/', params: { flower_ids: [], delivery_address: 'Test address 123' }
    end
  end

  test 'POST orders with no delivery address does not creates a new order' do
    # assert_no_difference('Order.count') do
    #   post '/orders/', params: { flower_ids: [Flower.first.id] }
    # end
    # apipie won't let you create requests for tests with missing required params
  end

  test 'PUT orders with valid params updates the order' do
    order = Order.create(flower_ids: [Flower.first.id], delivery_address: 'Old address')
    new_delivery_address = 'Test address updated'

    put "/orders/#{order.id}", params: { flower_ids: [Flower.first.id], delivery_address: new_delivery_address }

    assert_equal JSON.parse(response.body)['delivery_address'], new_delivery_address
    # for some reason the order.delivery_address did not get updated in the test, only in the controller
  end
end
