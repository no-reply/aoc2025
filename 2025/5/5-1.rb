#!/bin/ruby

on_list = false
ingredients = []
fresh_ranges = []

File.readlines("5.input").each do |l|
  (on_list = true) && next if l.strip.empty?

  if on_list
    ingredients << l.to_i
  else
    first, last = l.split('-').map(&:to_i)
    fresh_ranges << (first..last)
  end
end

count = 0
ingredients.each do |i|
  fresh_ranges.each do |range|
    if range.include?(i)
      count += 1
      break
    end
  end
end
puts count
