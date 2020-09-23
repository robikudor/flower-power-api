class FlowersController < ApplicationController
  def index
    render json: Flower.all
  end

  def recommend
    render json: Flower.where(recommend_params)
  end

  private

  def recommend_params
    params.permit(:color, :occasion, :form)
  end
end
