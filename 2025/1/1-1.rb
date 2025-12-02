#!/bin/ruby

class Dial
  # @param arry [Array<Integer>]
  def initialize(arry)
    @arry = arry.to_a
  end

  # @return [Integer]
  def pointer
    @arry[0]
  end
  
  # @param input [String, Integer]
  #
  # @return [Integer] 
  def rotate(input)
    case input
    when String
      return rotate(input.sub("R", "").sub("L", "-").to_i)
    else
      @arry.rotate!(input.to_i)
    end
    @arry[0]
  end
end

dial = Dial.new(0..99)
dial.rotate("50")

count = 0

File.readlines("1.input").each do |line|
  (count += 1) if dial.rotate(line) == 0
end

puts count
