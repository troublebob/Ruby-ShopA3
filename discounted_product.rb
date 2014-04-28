require_relative 'product.rb'
class Discounted_Product < Product
  attr_reader :discount
  def initialize(n, np, c, d)
    super n, np, c, @flag = 'D'
    @discount = d
  end

  def to_s
    "#{@name} #{@net_price} #{@count} DISCOUNTED by #{format('%.0f', @discount * 100)}%"
  end

  def gross_price
    super - (super * @discount)
  end

end