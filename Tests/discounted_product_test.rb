require 'test/unit'
require_relative '../discounted_product'
class Discounted_Product_Test < Test::Unit::TestCase
  def setup
    n ='name'
    np = 0
    c = 0
    d = 0.1
    f = 'D'
    @product = Discounted_Product.new(n, np, c, d)
  end
  def test_initialize
    assert_equal 0, @product.count, 'Empty'
    assert_equal 0, @product.net_price, 'Empty'
    assert_equal 'name', @product.name, 'Test Setup'
  end
  def test_to_s
    assert_equal 'name 0 0 DISCOUNTED by 10%', @product.to_s, 'To S not working'
  end
  def test_discount_exists
    assert_equal 0.1 , @product.discount,'Discount not being stored'
  end
  def test_gross_price
    @product = Discounted_Product.new('Discount', 1 ,1 ,0.1)
    assert_equal 1.08, @product.gross_price, 'Gross_price'
  end
  def test_gross_0
    @product = Discounted_Product.new('Discount', 0, 0, 0.1)
    assert_equal 0, @product.gross_price, 'Div by 0'
  end
end