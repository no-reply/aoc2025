#!/bin/ruby

total = File.readlines("3.input").each_with_object([]) do |bank, acc|
  jolts = bank.chomp.chars.map(&:to_i)
  heap = Array.new(12, 0)
  llimit = 0
  heap.each_with_index do |_,idx|
    rlimit = (jolts.length) - ((12 - idx))
    bounded = jolts[llimit..rlimit]
    max_in_bound = bounded.max
    llimit = llimit + bounded.find_index(max_in_bound) + 1
    heap[idx] = max_in_bound
  end
  acc << heap.join.to_i
end

# lol
# total = File.readlines("3.input").each_with_object([]) do |bank, acc|
#   jolts = bank.chomp.chars.map(&:to_i)
#   max = jolts.combination(12).max do |a, b|
#     a.join.to_i <=> b.join.to_i
#   end
#   acc << max.join.to_i
# end

puts total.sum


