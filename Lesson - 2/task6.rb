purchases = {}

loop do 
  puts "Введите название товара или 'Стоп' для подсчета покупок"
  product_name = gets.chomp.capitalize
break if product_name == "Стоп"
  puts "Введите цену товара"
  price = gets.chomp.to_i
  puts "Введите количество товара"
  quantity = gets.chomp.to_i
  purchases[product_name] = { "priсe" => price, "quantity" => quantity }
end

puts purchases 

sum = 0
all_sum = 0

purchases.each do |prod, value|
sum = value.values[0] * value.values[1]
all_sum += sum
  puts "#{prod} приобретено на сумму #{sum}" 
end

puts "Общая сумма покупок: #{all_sum}"







 