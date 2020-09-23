class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :completed, :delivery_address

  has_many :flowers
end
