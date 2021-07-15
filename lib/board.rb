require './lib/cell'
require "pry"
class Board

  def cells
  letters = ("A".."D")
    letters_array = []
    letters.each do |letter|
      4.times do |num|
        num += 1
        letters_array << letter+num.to_s
      end
      letters_array
    end

    coord_hash = Hash.new
      letters_array.map do |a|
        coord_hash[a] = Cell.new(a)
      end
  end
binding.pry

end
