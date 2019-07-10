def alphabet_position_replacement(string)
  string_of_letter_values = ''
  array_of_letters = string.delete(' ').gsub(/[^0-9a-z ]/i, '').upcase.split("")
  alphabet_hash = {"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5,
    "F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10, "K" => 11,
    "L" => 12, "M" => 13, "N" => 14, "O" => 15, "P" => 16, "Q" => 17,
    "R" => 18, "S" => 19, "T" => 20, "U" => 21, "V" => 22, "W" => 23,
     "X" => 24, "Y" => 25, "Z" => 26, }

  array_of_letters.each { |letter|

    string_of_letter_values << alphabet_hash[letter].to_s + " "
  }
  return string_of_letter_values[0...string_of_letter_values.length-1]

end
