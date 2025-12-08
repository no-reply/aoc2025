#!/bin/ruby

boxes = []

file = "8.input"

def distance(p, q)
  x = (p[0] - q[0])**2 + (p[1] - q[1])**2 + (p[2] - q[2])**2
  Math.sqrt(x)
end

def euclid_sort(bxs)
  with_distances = bxs.combination(2).map do |a, b|
    [distance(a, b), a, b]
  end

  with_distances.sort { |a, b| a.first <=> b.first }
end

def connect(a, b, circuits)
  sets = circuits.select { |c| c.include?(a) || c.include?(b) }
  return circuits << Set[a,b] if sets.empty?

  if sets.count == 2
    sets.each { |s| circuits.delete(s) }
    new_set = sets[0].union(sets[1])
    new_set << a
    new_set << b
    circuits << new_set
  else
    sets.first << a << b
  end
end

File.readlines(file).each { |c| boxes << c.split(',').map(&:to_i) }

circuits = []
connection_count = 0
euclid_sort(boxes).each do |_, a, b|
  connect(a, b, circuits)
  boxes.delete(a)
  boxes.delete(b)
  if boxes.empty? && circuits.count == 1
    puts a[0] * b[0]
    break
  end
end
