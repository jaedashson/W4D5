require "byebug"

# space complexity: how many new variables do I need to declare?

# time: O(n!)
# space: O(n!)
def first_anagram?(string1, string2)
    anagrams = permutations(string1)

    anagrams.include?(string2)
end

def permutations(string)
  return [string] if string.length <= 1

  first = string[0]
  partial_str = string[1..-1]

  perms = []
  perms += permutations(partial_str)

  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + first + perm[i..-1]
    end
  end

  total_permutations
end

# p first_anagram?("gizmo", "lives")

# time: O(n^2)
# space: O(n)
def second_anagram?(string1, string2)
  string1.each_char do |char| # n
    index = string2.index(char) # n

    return false if index.nil?

    string2[index] = ""
  end

  string2.empty?
end

# p second_anagram?("elvis", "asdfafs")

# time: O(nlogn)
# space: O(n)
def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

# p third_anagram?("elvis", "asdfs")

# time: O(n)
# space: O(1) only two hashes
def fourth_anagram?(string1, string2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  string1.each_char { |char| hash_1[char] += 1 }
  string2.each_char { |char| hash_2[char] += 1 }
 
  hash_1 == hash_2
end

# p fourth_anagram?("elvis", "asdasd")