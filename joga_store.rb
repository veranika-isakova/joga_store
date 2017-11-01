 @shopping_cart = [ ]

 @products = [
  { reference_number: 1231, name: "Super Lite Mat", price: 10 },
  { reference_number: 1232, name: "Power Mat", price: 20 },
  { reference_number: 1233, name: "Block", price: 30 },
  { reference_number: 1234, name: "Meditation cushion", price: 30 },
  { reference_number: 1235, name: "The best T-shirt", price: 200 },
  { reference_number: 1236, name: "The cutest yoga pants", price: 300 },
  { reference_number: 1237, name: "Bring Yoga To Life", price: 30 },
  { reference_number: 1238, name: "Light On Yoga", price: 10 }
]


#User should be able to select a product by its reference_number and it will be added to the shopping cart.
def listing_items
  @products.each do |item|
 puts "item: #{item[:name]} \n reference_number: #{item[:reference_number]} \n price: #{item[:price]}"
end
end

def select_products
  puts "Please put your REFERENCE NUMBER"
gets.to_i
end

def add_product_to_cart(reference_number)
  product = look_up_product(reference_number)
  if product != nil
    @shopping_cart << product
    puts "Congratulations. '#{product[:name]}' has been added to the cart!"
  else
    puts "I don't think you selected a valid reference_number. Try again."
  end
end

def look_up_product(reference_number)
  @products.each do |product|
  if product[:reference_number] == reference_number.to_i
    return product
  end
end
end

def print_shopping_card
    @shopping_cart.each do |item|
   puts "item: #{item[:name]} \n  reference_number: #{item[:reference_number]} \n price: #{item[:price]}"
end
end

def continue_shopping
  puts "Do you want to continue shopping? (Y/N)"
  @answer = gets.chomp.upcase
end

#If user decides to checkout, print out a bye-bye message.


puts "Welcome to our store!"
sleep 2

listing_items

loop do
  reference_number = select_products
  add_product_to_cart(reference_number)
  print_shopping_card
  continue_shopping

  if @answer == "N"
    puts "Bye-bye!!!"
  break

  end
end
