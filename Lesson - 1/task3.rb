puts "Я помогу определить, каким является ваш треугольник."
puts "Для этого введите его три стороны a, b, c поочереди."
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
sides = []
sides.push a, b, c
sides = sides.sort


a = sides[0]
b = sides[1]
c = sides[2]



if  c == b && b != a
  puts "Треугольник равнобедренный"
elsif  a**2 + b**2 == c**2
  puts "Треугольник прямоугольный"	
elsif a == b && b == c
  puts "Треугольник равтосторонний"
elsif (a + b) < c
  puts "Такого треугольника не существует"
 else
  puts "Ваш треугольник не равтосторонний, не равнобедренный и не прямоугольный"
end 	


