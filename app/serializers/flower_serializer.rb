class FlowerSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :color, :occasion, :form, :ordered_count
end
