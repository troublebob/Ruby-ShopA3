class Product

  attr_accessor :name, :net_price, :count, :flag

  def initialize(n, np, c, f)
    @name = n
    @net_price = np
    @count = c
    @flag = f
    @vat = 0.2
  end

  def net_price
    @net_price
  end

  def gross_price
    @gross_price = @net_price + (@net_price * @vat)
  end

  def to_s
    "#{@name} #{@net_price} #{@count} #{@flag}"
  end
end