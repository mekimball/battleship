require './lib/cell'

class Board

attr_reader :cells,:rows, :colums

  def initialize
    @cells = {}
    create_cell
    end

  def create_cell
    rows =["A","B", "C", "D"]
    colums = ["1", "2", "3", "4"]
    rows.each do |letter|
    colums.each do |number|
    coordinates = letter+number
    @cells[coordinates] = Cell.new(coordinates)
        end
      end
    end

 def valid_coordinate?(cell)
   @cells.include?(cell)
  end

def letters_map(coordinates)
  coordinates.map do |coordinate|
  coordinate[0].ord
end
end

def numbers_map(coordinates)
  coordinates.map do |coordinate|
     coordinate[1].to_i
 end
end

def valid_placement?(ship,coordinates)
  letters =letters_map(coordinates)
  numbers =numbers_map(coordinates)
 if valid_size?(ship,coordinates) && availible(coordinates) && letters.uniq.count == 1 && numbers.each_cons(2).all? {|a,b| b == a + 1}
   true
 elsif valid_size?(ship,coordinates) && availible(coordinates) && numbers.uniq.count == 1 && letters.each_cons(2).all? {|a,b| b == a + 1}
  true
else
  false
end
end

def place (ship, coordinates)
  coordinates.each do |coordinate|
  @cells[coordinate].place_ship(ship)
    end
  end

  def availible(coordinates)
    #go through coordinates and will return true/false based off what we do to block
    coordinates.all? do|coordinate|
      #using the empty method created to determine if a ship if there or not, if all coords are empty then they are availible
    @cells[coordinate].empty?
  end
  end
  def valid_size?(ship,coordinates)
  ship.length == coordinates.length
end
def render(reveal = false)
 board = "  1 2 3 4 \n" +
"A #{@cells["A1"].render(reveal)} #{@cells["A2"].render(reveal)} #{@cells["A3"].render(reveal)} #{@cells["A4"].render()} \n" +
"B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
"C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
"D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
end

end





#make helper size method
#  def valid_size?(ship,coordinates)
# #creating length variable to use each cons
#    @ship_length = ship.length
#    ship.length == coordinates.length
#  end

 #break down coordinate into seperate arrays one for letter and one for number
 #make letters array
#  def split_coords(coordinates)
#  @letters = coordinates.map do |coordinate|
#    coordinate[0].ord
#
# end
#   @numbers = coordinates.map do |coordinate|
#      coordinate[1].to_i
#  end
# binding.pry
#
#  end
#
#
# def check_numbers_consecutive
# @numbers.each_cons(2).all? {|a,b| b == a + 1}
# || @numbers.uniq.count == 1
# end
# def check_letters_consecutive
#   @letters.each_cons(2).all? {|a,b| b == a + 1} || @letters.uniq.count == 1
# end




    # if is_all_the_same?(characters)
    #
    #   check_if_cosecutive(numbers)
    # elsif is_all_the_same(numbers)
    # end
    # false



#    def consecutive_letter(coordinates)
#    coordinates.each_cons(2).all? {|a , b| b == a + 1}
#     end
#
#    def same_number?(coordinates)
#    coordinates.each_cons(2).all? {|a,b| b == a}
# end
#
# def same_letter?(coordinates)
#   coordinates.each_cons(2).all? {|a,b| b == a}
# end





  # def valid_placement?(ship,coordinates)
  #   ship.length == coordinates.length



    # p =coordinates[0]
    # if p.next == coordinates[1]
    #   p == coordinates[1]
    #   p.next == coordinates[2]

    #if the letters are the same then numbers must be consecutive
    #if numbers are the same then letters must be consecutive
    # if letters are the same && numbers are consecutive true
    #if letters are consecutive && numbers are the same true
   #else false



    #use coordinats.each_cons(1) to get everything stacked
    #then below
  #check if letters are the same
  #check if numebers are the same
  #check if numbers are consecutive
  #check if letters are consecutive
