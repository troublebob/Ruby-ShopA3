require 'test/unit'
require_relative '../shop.rb'
require_relative '../product.rb'
require_relative '../shopper.rb'
class Shopper_Test < Test::Unit::TestCase
  def setup
    @shop = Shop.new

  end

  def test_name
    @shopper = Shopper.new('Ted')
    @shopper.name = 'Barry'
    assert_equal 'Barry', @shopper.name, 'Name Stored'
  end

  def test_empty
    @shopper = Shopper.new('Ted')
    assert_equal true, @shopper.is_empty, 'Is Not Empty'
  end

  def test_is_not_empty
    @shopper = Shopper.new('Ted')
    @product = Product.new('Test Product',5,1,'N')
    @shopper.add_product(@product)
    assert_equal false, @shopper.is_empty, 'Is Empty'
  end

  def test_count_increments
    @shopper = Shopper.new('Ted')
    @product = Product.new('Test Product', 5, 1, 'N')
    @shopper.add_product(@product)
    @shopper.add_product(@product)
    assert_equal 2, @shopper.total_product_count, 'Count increments'
  end

  def test_unsuccessful_shop
    @shopper = Shopper.new('Barry')
    @product = Product.new('test',10,1,'N')
    @shop.add_product(@product)
    assert_equal false, @shopper.unsuccessful_shopping_trip, 'Trippin'
    @shopper.add_product(@shop.remove_product_bought_by_shopper(0))

    @shopper.add_product(@shop.remove_product_bought_by_shopper(0))

    @shopper.add_product(@shop.remove_product_bought_by_shopper(0))

    @shopper.add_product(@shop.remove_product_bought_by_shopper(0))

    assert_equal true, @shopper.unsuccessful_shopping_trip, 'Trippin'

  end

end