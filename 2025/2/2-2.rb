#!/bin/ruby

file = File.open('2.input')

invalid_ids = []

def invalid?(id)
  halvsies = (id.length / 2) - 1
  
  (0..halvsies).each do |pos|
    part = id[0..pos]

    (0..(id.length / part.length)).each do |multi|
      return true if id == (part * multi)
    end
  end
  
  false
end
  

while range = file.gets(',') do
  first, last = range.chomp(',').split('-')
  
  (first.to_i..last.to_i).each do |i|
    str = i.to_s
    invalid_ids << i if invalid?(str)
  end
end

puts invalid_ids.sum
