#!/bin/ruby

file = File.open('2.input')

invalid_ids = []

while range = file.gets(',') do
  first, last = range.chomp(',').split('-')
  
  (first.to_i..last.to_i).each do |i|
    str = i.to_s
    
    halvsies = str.length / 2
    (0..halvsies).each do |pos|
      part = str[0..pos]
      invalid_ids << i if str == "#{part}#{part}"
    end
  end
end

puts invalid_ids.sum
