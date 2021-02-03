puts "Я помогу определить, каким является ваш треугольник."
puts "Для этого введите его три стороны a, b, c поочереди."
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
sides = []
sides.push a, b, c
sides.sort


if a == b && a == b && b != c
  puts "Треугольник равнобедренный"
elsif  a**2 + b**2 == c**2
  puts "Треугольник прямоугольный"	
elsif a == b && b == c
	puts "Треугольник равтосторонний"
 else
 	puts "Такого треугольника не существует"
end 	
