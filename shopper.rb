require_relative 'product.rb'
require_relative 'shop.rb'
require_relative 'discounted_product.rb'
require_relative 'free_product.rb'
class Shopper

  attr_reader :unsuccessful_shopping_trip, :unsuccessful_attempts
  attr_accessor :name

  def initialize(name)
    @shopping_bag = []
    @name = name
    @shopping_bag_empty = true
    @unsuccessful_shopping_trip = false
    @unsuccessful_attempts = 0
  end

  def is_empty
    @shopping_bag_empty
  end

  def shopping_list
    s = ''
    @shopping_bag.each do |product|
      s += "#{product.to_s}\n"
    end
    s
  end

  def total_net_value
    tn = 0
    @shopping_bag.each do |product|
      a = product.net_price
      b = product.count
      tn += a * b
    end
    tn
  end

  def how_much_spent
    tg = 0
    @shopping_bag.each do |product|
      tg += product.gross_price * product.count
    end
    tg
  end

  def add_product(p)
  if p == nil
    @unsuccessful_attempts +=1
    if @unsuccessful_attempts > 2
      @unsuccessful_shopping_trip = true
    end
    return false
  end


  @shopping_bag.each do |product|
    if product.name == p.name
      product.count += 1
      return true
    end
  end
  @shopping_bag.push(p)
  @shopping_bag_empty = false
  return true
  end

  def total_product_count
    c = 0
    @shopping_bag.each do |product|
      c += product.count
    end
    c
  end
end

#puts "TESTING \tNET #{product.net_price}\tCOUNT #{product.count}\tA #{a}\tB #{b}\tCALC #{product.net_price * product.count}\tCALC IN CODE #{tn}\tCALC CODE FLOAT #{tn.to_f}\t to_s #{product.to_s}"