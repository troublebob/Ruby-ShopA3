require_relative 'shop.rb'
require_relative 'shopper.rb'
require_relative 'product.rb'
require_relative 'free_product'
require_relative 'discounted_product'
class Shopping_Simulation

  def run
    filename='shop.dat'
    shop = Shop.new
    shopper = []
    Random.new()

    IO.foreach(filename) do |line|
      data=line.split

      name=data[0]
      price=data[1].to_f
      count=data[2].to_i
      flag=data[3]
      discount = 0.2

      if flag =='N'
        product = Product.new(name, price, count, flag)
      elsif flag == 'D'
        product = Discounted_Product.new(name, price, count, discount)
      elsif flag == 'F'
        product = Free_Product.new(name, price, count)
      else
        Puts "Error Product not tagged: #{Name}"
      end

      shop.add_product(product)
    end

    total_pre_shop_net = shop.total_net_value
    total_pre_shop_gross = shop.total_gross_value
    total_shop_pre_count = shop.total_product_count
    k = shop.products.size
    total_shopper_net = 0
    total_shopper_gross = 0
    total_shopper_product_count = 0

    (0 .. 19).each do |i|
      shopper[i] = Shopper.new("Shopper Number-#{i}")
      (0 .. 19).each do
        r = rand(0 .. (k-1))
        if shopper[i].add_product(shop.remove_product_bought_by_shopper(r)) == false
          puts "#{shopper[i].name} has tried to buy #{(shop.products[r]).name} but it is sold out"
        else
          puts "#{shopper[i].name} has bought #{(shop.products[r]).name}"
        end
        if shopper[i].unsuccessful_shopping_trip
          puts "#{shopper[i].name} has failed to buy 3 times and has decided to go home"
          break
        end
      end
      #puts shopper[i].shopping_list
      total_shopper_net += shopper[i].total_net_value
      total_shopper_gross += shopper[i].how_much_spent
      total_shopper_product_count += shopper[i].total_product_count
    end

    if total_pre_shop_net.round(2) == (total_shopper_net + shop.total_net_value).round(2) && total_pre_shop_gross.round(2) == (total_shopper_gross + shop.total_gross_value).round(2)
      puts "\nShop and Shopping bags are in a consistent state!"
    end

    puts "Shop contained #{total_shop_pre_count} products and now contains #{shop.total_product_count}\nShoppers bought #{total_shopper_product_count} items\n\nSorted\n"
    shopper.sort!{|s1 , s2| s2.how_much_spent <=> s1.how_much_spent}
    shopper.each do |list|
      puts "#{list.name} €#{(list.how_much_spent).round(2)}"
    end

  end
end