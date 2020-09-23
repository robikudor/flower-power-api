class OrdersController < ApplicationController
  def index
    render json: Order.all.map { |ord| {order: ord, flowers: ord.flowers.pluck(:name).join(', ') } }
  end

  def create
    new_order = Order.new(delivery_address: 'New address')

    new_order.flower_ids = params[:flower_ids]
    total_price = new_order.calculate_price
    new_order.update(total_price: total_price)

    render json: new_order
  end

  def update
    return render status: :not_found unless order

    order.flower_ids = order_params[:flower_ids]
    total_price = order.calculate_price
    order.update(delivery_address: delivery_address, total_price: total_price)

    render json: order
  end

  private

  def order
    @order ||= Order.find_by(params[:id])
  end

  def order_params
    params.require(:order).permit(:flower_ids, :delivery_address)
  end
end
