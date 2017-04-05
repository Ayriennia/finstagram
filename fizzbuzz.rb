puts "FizzBuzz!"


(1..100).to_a.each do |next_number|
   
   if next_number % 15 == 0
        puts "fizz!"
    elsif next_number % 5 == 0
        puts "buzz"
    elsif next_number % 3 == 0 
        puts "FizzBuzz!"
    else
        puts "#{next_number}"
   end

    
end