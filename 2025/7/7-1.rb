#!/bin/ruby

beams = Set[]
split_count = 0

File.readlines("7.input").each do |l|
  map_row = l.chars
  new_beams = Set[]
  splits = []
  map_row.each_with_index do |c, i|
    splits << i if c == "^"
  end
  beams.each do |b|
    if splits.include?(b)
      split_count +=1
      new_beams << b + 1
      new_beams << b - 1
    else
      new_beams << b
    end
  end
  new_beams << map_row.find_index("S")
  beams = new_beams
end

puts split_count
