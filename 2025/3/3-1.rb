#!/bin/ruby

total = File.readlines("3.input").each_with_object([]) do |bank, acc|
  max = 0
  jolts = bank.chars
  jolts.each_with_index do |i, idx_i|
    jolts.each_with_index do |j, idx_j|
      next if idx_i >= idx_j
      joltage = "#{i}#{j}".to_i
      max = joltage if (max < joltage)
    end
  end

  acc << max
end

puts total.sum
