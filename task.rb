puts "Введите ваше имя"
name = gets.chomp.capitalize

puts "Введите ваш рост"
growth = gets.chomp

growth = (growth.to_i - 110) * 1.15
if growth > 0
	puts "#{name}, ваш идеальный вес #{growth} кг."
    else
      puts "Ваш вес уже оптимальный."	
end    
