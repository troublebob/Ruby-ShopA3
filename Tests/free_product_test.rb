require 'test/unit'
require_relative '../free_product'
class Free_Product_Test < Test::Unit::TestCase
  def setup
    n ='name'
    np = 10
    c = 10
    f = 'F'
    @product = Free_Product.new(n, np, c,)
  end
  def test_1
    assert_equal 0, @product.gross_price, 'Gross Price overridden'
  end
  def test_to_s
    assert_equal 'name 10 10 FREE PRODUCT', @product.to_s, 'To String Check'
  end
end