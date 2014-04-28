require_relative 'product.rb'

class Shop
  attr_reader :products
  def initialize
    @products = []
    @empty = true
  end

  def is_empty
    @empty
  end

  def add_product(p)
    @products.push(p)
    @empty = false
  end

  def to_s
    s = ''
    @products.each do |product|
      s += product.to_s + "\n"
    end
    s
  end

  def total_net_value
    t = 0
    @products.each do |product|
      t += product.net_price * product.count
    end
    t
  end

  def total_product_count
    t=0
    @products.each do |product|
      t += product.count
    end
    t
  end

  def total_gross_value
    t = 0
    @products.each do |product|
      t += product.gross_price * product.count
    end
    t
  end

  def remove_product_bought_by_shopper(int)

    if @products[int].count == 0
      return nil
    else
      @products[int].count -= 1
      if @products[int].flag=='N'
        @bought_product = Product.new(@products[int].name, @products[int].net_price, 1,@products[int].flag )
      elsif @products[int].flag=='D'
        @bought_product = Discounted_Product.new(@products[int].name, @products[int].net_price, 1,@products[int].discount)
      elsif @products[int].flag=='F'
        @bought_product = Free_Product.new(@products[int].name, @products[int].net_price, 1 )
      end
    end


  end

  def average_price
    product_count=0
    product_price=0
    @products.each do |product|
      product_count += 1
      product_price += product.gross_price
    end
    product_price/product_count
  end
end
