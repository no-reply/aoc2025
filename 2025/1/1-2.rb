#!/bin/ruby

class Dial
  # @param arry [Array<Integer>]
  def initialize(arry)
    @arry = arry.to_a
    @len = arry.count
  end

  def [](i)
    @arry[i]
  end
  
  # @return [Integer]
  def pointer
    self[0]
  end

  # @param input [String, Integer]
  #
  # @return [Integer] the number of times the dial points at 0 during the rotation
  def rotate(input)
    case input
    when String
      return rotate(input.sub("R", "").sub("L", "-").to_i)
    else
      zeros = 0
      i = input.to_i

      puts "pointer: #{pointer}"
      puts "rotate: #{i}"
      
      rotations = (i.abs / @len)
      zeros += rotations

      remainder = (i.abs % @len)
      
      if i < 0
        p = pointer.zero? ? 100 : pointer
        zeros += 1 if p - remainder <= 0
        @arry.rotate!(i)
      elsif i > 0
        @arry.rotate!(i)
        zeros += 1 if pointer < remainder
      end
              
      puts "pointer: #{pointer}"

      return zeros
    end
  end
end

dial = Dial.new(0..99)

last = dial.rotate("50")

count = 0

File.readlines("1.input").each do |line|
  count += dial.rotate(line)
  puts "count: #{count}"
end

puts count
