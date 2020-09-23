class FlowerOrder < ApplicationRecord
  belongs_to :flower
  belongs_to :order
end
