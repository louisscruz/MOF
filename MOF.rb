# This script checks for the existence of Multiple-Order-Function (MOF) rows
# for all permutations of a given number of objects (pitches).

# Example: If n is defined as 12, the script will generate all 479,001,600 permutations,
# check each permutation for MOF properties, and print all MOF rows that it finds.

class Array
  # This method takes a given array and outputs a reording of every nth pitch, transposed to begin with 0
  # For example: every 2nd object of [0, 1, 2, 3] is [1, 3, 0, 2], which is then transposed to [0, 2, 3, 1]
  def every_nth(n)
    length = self.length
    new_array = []
    if self.length.even?
      new_array = self
      new_array = new_array.push('x')
    end
    new_array = self * n
    new_array = new_array.each_slice(n).map(&:last)
    new_array = new_array.slice(0, length)
    trans = new_array[0]
    return new_array.map { |i| (i+(length-trans)) % (length)}
  end
end

# Defines the number of objects
n = 6

# Generates all permutations
all_orders = (0..(n-1)).to_a.permutation.to_a

# Cycles through all permutations
# For each permutation, this loops through every_nth from two to the number of objects.
# If the permutation is the same as every_nth for each divisor, then the permutation has the MOF quality.
# The script prints each MOF series.

all_orders.each do |arr|
  self_sim_count = 1
  (2..n).each do |x|
    tester = arr.dup
    if arr == tester.every_nth(x)
      self_sim_count += 1
    else
      break
    end
  end
  if self_sim_count == n
    print arr
  end
end
