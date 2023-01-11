require 'pry-byebug'

def caesar_cipher(string, shift_factor)

    chars = string.split('')
    chars_to_ascii = chars.map {|char| char.ord}


    chars_shift = chars_to_ascii.map do |ascii_char|
        if ascii_char > 122 or ascii_char < 65 
            ascii_char
        else
            ascii_char += shift_factor
        end
    end
    cipher = chars_shift.map {|char| char.chr}

    p cipher
end

caesar_cipher("What a string!", 5)