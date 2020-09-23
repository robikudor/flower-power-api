class FlowersController < ApplicationController
  api :GET, '/flowers', 'Get all flowers'
  def index
    render json: Flower.all
  end

  api :GET, '/flowers', 'Get all flowers'
  param :color, String, in: Flower.colors
  param :occasion, String, in: Flower.occasions
  param :form, String, in: Flower.forms
  def recommend
    render json: Flower.where(recommend_params)
  end

  private

  def recommend_params
    params.permit(:color, :occasion, :form)
  end
end
