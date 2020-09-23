require 'test_helper'

class FlowerTest < ActiveSupport::TestCase
  test "should not save the flower without color" do
    flower = Flower.new(occasion: :birthday, form: :rounded, price: 1, description: '123', image: 'image.jpg')

    assert_not flower.save
  end

  test "should not save the flower without occasion" do
    flower = Flower.new(color: :red, form: :rounded, price: 1, description: '123', image: 'image.jpg')

    assert_not flower.save
  end

  test "should save when the flower when attributes are correct" do
    flower = Flower.new(color: :red, occasion: :birthday, form: :rounded, price: 1, description: '123', image: 'image.jpg')

    assert flower.save
  end
end
