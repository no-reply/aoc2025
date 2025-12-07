#!/bin/ruby

timelines = {}

File.readlines("7.input").each do |l|
  timelines[l.chars.find_index("S")] = 1 if
    timelines.empty?

  splits = []
  l.chars.each_with_index do |c, i|
    splits << i if c == "^"
  end

  splits.each do |s|
    next unless timelines.has_key?(s)
    count = timelines[s]

    timelines.delete(s)

    timelines[s+1] = (timelines[s+1] || 0) + count
    timelines[s-1] = (timelines[s-1] || 0) + count
  end
end

puts timelines.values.sum
