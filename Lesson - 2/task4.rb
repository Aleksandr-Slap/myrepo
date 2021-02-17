hash = {}
alp = ('a'..'z').to_a
alp.each_with_index do |letter, i|
  if "aeiyu".include?(letter)
    hash[letter] = i + 1
  end
end
  
puts hash

    