puts "Введите порядковый номер месяца"
month = gets.chomp.to_i
puts "Введите число"
day = gets.chomp.to_i
puts "Введите год"
year = gets.chomp.to_i

months = { 1 => 31,
           2 => 28, 
           3 => 31,
           4 => 30, 
           5 => 31, 
           6 => 30, 
           7 => 31, 
           8 => 31, 
           9 => 30, 
           10 => 31, 
           11 => 30, 
           12 => 31 }

if (year % 400 == 0) or (year % 4 == 0 || year % 100 != 0)
  months[2] = 29
end
sum = 0

months.each do |m, d| 
  if m < month 
   sum += d
  end
end
sum += day

puts sum
