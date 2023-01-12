dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings(string, dictionary)
  words_array = string.split(' ')
  words_array.reduce(Hash.new(0)) do |hash, word|
    dictionary.each do |check|
      hash[check] += 1 if word.upcase.include?(check.upcase)
    end
    hash
  end
end

p substrings("Howdy partner, sit down! How's it going?", dictionary)
