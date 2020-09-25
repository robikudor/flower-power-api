class OrdersController < ApplicationController
  api :GET, '/orders', 'Get all orders'
  def index
    render json: Order.all
  end

  api :POST, '/orders', "Create an order"
  param :delivery_address, String, required: true
  param :flower_ids, Array, required: true
  def create
    new_order = Order.new()

    new_order.flower_ids = params[:flower_ids]
    new_order.update(order_params.merge(total_price: new_order.calculate_price))

    render json: new_order
  end

  api :POST, '/orders/:id', "Update an order"
  param :delivery_address, String, required: true
  param :flower_ids, Array, required: true
  def update
    return render status: :not_found unless order

    order.flower_ids = order_params[:flower_ids]
    order.update(order_params.merge(total_price: order.calculate_price))

    render json: order
  end

  private

  def order
    @order ||= Order.find_by(id: params[:id])
  end

  def order_params
    params.permit(:flower_ids, :delivery_address)
  end
end
