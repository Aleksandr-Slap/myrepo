puts 'Введите 3 коффициента a, b и c.'
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i


puts "#{b}x^2 - 4 * #{a}x + #{c} = 0"
d = b*b - 4 * a * c 

if d < 0
  puts "D =" "#{d} " "корней нет"
elsif d == 0
  puts  "D = #{d}" + ' один корень: x =' + ((-b - Math.sqrt(d)) / 2 * a).to_s 
elsif d > 0
  puts "D = #{d} два корня" 
  puts 'x1 =' + ((-b - Math.sqrt(d)) / 2 * a).to_s
  puts 'x2 =' + ((-b + Math.sqrt(d)) / 2 * a).to_s
end
