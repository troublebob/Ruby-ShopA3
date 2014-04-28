require 'test/unit'
require_relative '../product.rb'
class Product_test < Test::Unit::TestCase
def setup
  n ='name'
  np = 0
  c = 0
  f = 'N'
  @product = Product.new(n, np, c, f)
end
def test_initialize
  assert_equal 0, @product.count, 'Empty'
  assert_equal 0, @product.net_price, 'Empty'
  assert_equal 'name', @product.name, 'Test Setup'
end
def test_name
  @product = Product.new('Wedge',5,5, 'N')
  assert_equal 'Wedge', @product.name, 'Test name'
end
def test_1 #Gross Price
  @product = Product.new('Test for Gross Price', 5, 5, 'N')
  assert_equal 5 + (5 * 0.2), @product.gross_price, 'Testing gross price'
end
def test_2 #Net Price
  @product = Product.new('Net', 10, 5, 'N')
  assert_equal 10, @product.net_price, 'Testing net price'
end
end

