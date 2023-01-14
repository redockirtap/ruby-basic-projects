require 'pry-byebug'

def caesar_cipher(string, shift_factor)
    chars = string.split('')
    chars_to_ascii = chars.map {|char| char.ord}


    chars_shift = chars_to_ascii.map do |ascii_char|
        if ascii_char > 122 or ascii_char < 65 or ascii_char.between?(90, 96)
            ascii_char
        elsif ascii_char + shift_factor > 90 and ascii_char + shift_factor < 97
            ascii_char = 64 + (ascii_char + shift_factor - 90)
        elsif ascii_char + shift_factor > 122 
            ascii_char = 96 + (ascii_char + shift_factor - 122)
        else
            ascii_char += shift_factor
        end
    end
    cipher = chars_shift.map {|char| char.chr}
    return cipher.join()
end

cipher = caesar_cipher("abcdefghijklmnopqrstuvwxyz", 1)
p cipher
