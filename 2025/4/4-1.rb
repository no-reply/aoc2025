#!/bin/ruby

rolls = []

File.readlines("4.input").each_with_index do |line,y|
  rolls << []
  line.chars.each_with_index do |sym,x|
    rolls[y] << x if sym == '@'
  end
end

accessible = 0
neighbors = [[-1,-1],
             [-1,1],
             [-1,0],
             [1,1],
             [1,-1],
             [1,0],
             [0,1],
             [0,-1]]

rolls.each_with_index do |row, y|
  row.each do |x|
    adj = 0
    neighbors.each do |x_offset, y_offset|
      next if (y + y_offset) < 0
      adj += 1 if rolls[y + y_offset]&.include?(x + x_offset)
      break unless adj < 4
    end
    next unless adj < 4
    accessible += 1
  end
end

puts accessible

