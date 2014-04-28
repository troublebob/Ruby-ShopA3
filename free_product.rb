require_relative 'discounted_product.rb'
class Free_Product < Product

  def initialize(n, np, c)
    super n, np, c, @flag = 'F'
  end

  def to_s
    "#{@name} #{@net_price} #{@count} FREE PRODUCT"
  end

  def gross_price
    0
  end

end