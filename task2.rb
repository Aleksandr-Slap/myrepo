puts "Что-бы рассчитать площадь треугольника введеите его высоту и основание"

puts "Введите высоту"
height = gets.chomp

puts "Введите основание"
base = gets.chomp

area = 0.5 * height.to_i * base.to_i
puts "Площадь тереугольника равна #{area}"
