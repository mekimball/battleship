require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'
class Game

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new('Submarine', 2)

  end
  def start
    puts welcome
    puts user_input
  end
  def welcome
    "Welcome to BATTLESHIP \n" +
    "press p to play. enter to quit"
  end
  def start_game
    player_board = Board.new
    computer_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    puts "Your Board"
    puts player_board.render(true)
    puts "Computer Board"
    puts computer_board.render

    # require "pry"; binding.pry
    coordinates = []
    puts "Choose your first coordinate for the Cruiser"
    cell_test = gets.chomp
    while player_board.valid_coordinate?(cell_test) == false
      puts "Sorry try again"
      cell_test = gets.chomp
    end
    coordinates << cell_test
    # require "pry"; binding.pry

    # require "pry"; binding.pry
    puts "Choose your second coordinate for the Cruiser"
    cell_test = gets.chomp
    while player_board.valid_coordinate?(cell_test) == false
      puts "Sorry try again"
      cell_test = gets.chomp
    end
    coordinates << cell_test

    puts "Choose your third coordinate for the Cruiser"
    cell_test = gets.chomp
    while player_board.valid_coordinate?(cell_test) == false
      puts "Sorry try again"
      cell_test = gets.chomp
    end
    coordinates << cell_test
    require "pry"; binding.pry
    if player_board.valid_placement?(cruiser, coordinates) == false
      puts "What the fuck is wrong with you? Try again"
      start_game
    end

    # if player_board.valid_placement?(@cruiser, coordinates)
    #   false
    #   puts "try again"
    # end
    player_board.place(@cruiser, coordinates)
    puts "Your Board"
    puts player_board.render(true)
    puts "Computer Board"
    puts computer_board.render
    # # require "pry"; binding.pry
    coordinates = []
    puts "Choose your first coordinate for the Submarine"
    coordinates << gets.chomp
    puts "Choose your second coordinate for the Submarine"
    coordinates << gets.chomp
    player_board.place(@submarine, coordinates)
    puts "Your Board"
    puts player_board.render(true)
    puts "Computer Board"
    puts computer_board.render
  end

  # def place
  #   p "Your first ship is the Cruiser. It's 3 spots long, where would you like to put it?"
  #   coordinates = []
  #   coordinates << gets.chomp
  #   cruiser = Ship.new("Cruiser", 3)
  #   # player_board.place(coordinates)
  #   require "pry"; binding.pry
  # end
  # coordinates.valid_placement?

  def user_input
    input = gets.chomp
    if input == "p"
      start_game
    elsif input /= "p"
      exit
    end
    # place
  end
end
