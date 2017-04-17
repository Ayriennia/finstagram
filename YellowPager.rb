def numbers_for_string(input_string)
    if input_string.size != 10
        return false
    end
    
   mappings = [{letters: ["A", "B", "C"], number: "2"},
               {letters: ["D", "E", "E"], number: "3"},
               {letters: ["G", "H", "I"], number: "4"},
               {letters: ["J", "K", "L"], number: "5"},
               {letters: ["M", "N", "O"], number: "6"},
               {letters: ["P", "Q", "R", "S"], number: "7"},
               {letters: ["T", "U", "V"], number: "8"},
               {letters: ["W", "X", "Y", "Z"], number: "9"}]
    
    output_result = ""
    input_string.split("").each do |input_char|
        input_char = input_char.upcase
        output_num = ""
    
        
        mappings.each do |next_mapping|
            if next_mapping[:letters].include?(input_char)
                output_num = next_mapping[:number]
            end
        end
    
        output_result << output_num
    end
    
    "(#{output_result[0..2]})-#{output_result[3..5]}-#{output_result[7..9]}"
end



test_strings = ["HelloWor", "AmazingWays", "Lighthouse"]

test_strings.each do |some_word|
    puts "Start: #{some_word}"
    result_number = numbers_for_string(some_word)
    puts result_number
end

