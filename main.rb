require_relative 'shop.rb'
require_relative 'free_product'
require_relative 'discounted_product'
require_relative 'shopping_simulation'

filename='shop.dat'
shop = Shop.new

IO.foreach(filename) do |line|
  data=line.split

  name = data[0]
  price = data[1].to_f
  count = data[2].to_i
  flag = data[3]
  discount = 0.2

  if flag == 'N'
    product = Product.new(name,price,count,'N')
  elsif flag ==  'D'
    product = Discounted_Product.new(name,price,count,discount)
  elsif flag == 'F'
    product = Free_Product.new(name,price,count)
  else
    puts "Error Product #{name} not flagged correctly!"
  end

  shop.add_product(product)
end
if __FILE__ == $0


  puts "\n\n*********SHOP*********\n**********************\n#{shop}\n\n"

  puts "Total Net Value: €#{format('%0.2f',shop.total_net_value)}\n"

  puts "Average Price: €#{format('%0.2f',shop.average_price)}\n"

  sim = Shopping_Simulation.new
  sim.run
end