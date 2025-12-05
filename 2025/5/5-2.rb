#!/bin/ruby

fresh_ranges = []

File.readlines("5.input").each do |l|
  break if l.strip.empty?
  first, last = l.split('-').map(&:to_i)
  fresh_ranges << (first..last)
end

def consolidate_ranges(fresh_ranges)
  old_count = fresh_ranges.count
  
  fresh_ranges.sort! do |a, b|
    if a.overlap?(b)
      0
    elsif a.first < b.first
      -1
    else
      1
    end
  end

  new_ranges = fresh_ranges.slice_when { |a, b| !a.overlap?(b) }.map do |ranges|
    min = ranges.map(&:min).min
    max = ranges.map(&:max).max
    (min..max)
  end

  return new_ranges if new_ranges.count == old_count
  consolidate_ranges(new_ranges)
end

puts consolidate_ranges(fresh_ranges).map(&:size).reduce(:+)
