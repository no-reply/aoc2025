#!/bin/ruby

def merge_range(r, s)
  ([r.min, s.min].min..[r.max, s.max].max)
end

def compact_ranges(new_range, ranges)
  result = nil

  ranges.each do |range|
    if range.overlap?(new_range)
      ranges.delete(range)
      result = compact_ranges(merge_range(range, new_range), ranges)
    end
  end

  result || (ranges << new_range)
end

fresh_ranges = []

File.readlines("5.input").each do |l|
  break if l.strip.empty? # ignore after first blank line
  first, last = l.split('-').map(&:to_i)
  fresh_ranges = compact_ranges((first..last), fresh_ranges)
end

puts fresh_ranges.map(&:size).reduce(:+)
