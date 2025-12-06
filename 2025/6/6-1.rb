#!/bin/ruby

problems = []

File.readlines('6.input').each do |l|
  problems << l.split.map(&:strip)
end

total = problems.transpose.map do |p|
  p[0..-2].map(&:to_i).inject(p.last.to_sym)
end.sum

puts total
