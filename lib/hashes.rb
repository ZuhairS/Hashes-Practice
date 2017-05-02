# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  word_lengths_hash = {}
  str.split.each { |word| word_lengths_hash[word] = word.length }
  word_lengths_hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.select { |_, v| v == hash.values.max }.keys.first
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each { |k, v| older[k] = v }
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  freq_hash = Hash.new(0)
  word.each_char { |ch| freq_hash[ch] += 1 }
  freq_hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  uniq_hash = {}
  arr.each { |el| uniq_hash[el] = 0 }
  uniq_hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  evens_and_odds_hash = Hash.new(0)
  numbers.each do |num|
    if num.even?
      evens_and_odds_hash["even"] += 1
    else evens_and_odds_hash["odd"] += 1
    end
  end
  evens_and_odds_hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  vowel_counter = Hash.new(0)
  vowels = "aeiou"
  string.downcase.each_char { |ch| vowel_counter[ch] += 1 if vowels.include?(ch) }
  vowel_counter.select { |_, v| v == vowel_counter.values.max }.keys.min
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  students.select { |_, v| v > 6 }.keys.combination(2)
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  bio_hash = Hash.new(0)
  specimens.each { |species| bio_hash[species] += 1 }
  bio_hash.length**2 * bio_hash.values.min / bio_hash.values.max
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_hash = character_count(normal_sign)
  vandalized_hash = character_count(vandalized_sign)

  vandalized_hash.all? { |ch, count| normal_hash[ch] >= count }
end

def character_count(str)
  hash = Hash.new(0)
  str.downcase.split.join.each_char { |ch| hash[ch] += 1 }
  hash
end
