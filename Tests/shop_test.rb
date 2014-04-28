require 'test/unit'
require_relative '../shop.rb'
require_relative '../product.rb'
class Shop_test < Test::Unit::TestCase
def setup
  @shop = Shop.new
end
def test_initialize
  assert_equal true, @shop.is_empty, 'Shop is not empty'
end
def test_1 #Total Net
  @product = Product.new(Test, 5.5, 10, 'N')
  @shop.add_product(@product)
  assert_equal 5.5*10, @shop.total_net_value, 'Net incorrect'
end
def test_2 #Average Price
  @product = Product.new(Test, 5.5, 10, 'N')
  @shop.add_product(@product)
  assert_equal 5.5*1.2, @shop.average_price, 'Average incorrect'
end
def test_3 #Not Empty Shop
  @product = Product.new(Test, 5.5, 10,'N')
  @shop.add_product(@product)
  assert_equal false, @shop.is_empty, 'Shop is not empty'
end
def test_4 #to_s
  @product = Product.new(Test, 5.5,10,'N')
  @shop.add_product(@product)
  assert_equal "Test 5.5 10 N\n", @shop.to_s, 'String Works'
end

def test_remove_product
  @product =Product.new(Test, 5, 10, 'N')
  @shop.add_product(@product)
  @t_product = @shop.remove_product_bought_by_shopper(0)
  assert_equal 'Test 5 1 N', @t_product.to_s, 'New Product not created'
end
def test_remove_empty
  @product =Product.new(Test, 5, 0,'N')
  @shop.add_product(@product)
  @t_product = @shop.remove_product_bought_by_shopper(0)
  assert_equal nil , @t_product, 'New Product empty'
end
end