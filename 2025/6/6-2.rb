#!/bin/ruby

problems = []
lines = []
File.readlines('6.input').each do |l|
  lines << l.chars
end

columns = lines.transpose

i = -1
columns.each do |col|
  next if col.all? { |c| c == "\n" || c == " "}
  i+=1 if col.include?('*') || col.include?('+')
  (problems[i] ||= []) << col
end

results = problems.map(&:transpose).map do |p|
  digits = p[0..-2]
  operator = p[-1].first.to_sym
  result = digits.transpose.map { |num| num.join().to_i }.inject(operator)
end

puts results.sum
