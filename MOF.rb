class Array
  # Takes a given array and returns an array of every nth pitch transposed to 0
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

# Define number of pitches
n = 6

# Generate all permutations
all_orders = (0..(n-1)).to_a.permutation.to_a

# Cycle through all permutations
all_orders.each do |arr|
  # Cycle through every nth step and track self-similarity count
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
