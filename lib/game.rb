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

    for ship_details in [{name:"Cruiser", len:3}, {name:"Submarine", len:2}] do
      ship = Ship.new(ship_details[:name], ship_details[:len])
      # require "pry"; binding.pry
      coordinates = []
      ship.length.times do
        puts "Choose your coordinate for #{ship.name}"
        cell_test = gets.chomp.capitalize
        until player_board.valid_coordinate?(cell_test)
          puts "Sorry try again"
          cell_test = gets.chomp.capitalize
        end
        coordinates << cell_test
      end
      unless player_board.valid_placement?(ship, coordinates)
        puts "What the fuck is wrong with you? Try again"
        start_game
      end
      player_board.place(ship, coordinates)
      # require "pry"; binding.pry
    end

    puts "Your Board"
    puts player_board.render(true)
    puts "Computer Board"
    puts computer_board.render


    puts "Your Board"
    puts player_board.render(true)
    puts "Computer Board"
    puts computer_board.render
  end
  def user_input
    input = gets.chomp
    if input == "p"
      start_game
    elsif input != "p"
      exit
    end
    # place
  end
end
