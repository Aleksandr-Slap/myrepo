fib = [0, 1]
loop do 
  new_fib = fib[-1] + fib[-2]
 break if new_fib >= 100
   fib << new_fib
end
puts fib