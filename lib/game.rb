require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'
class Game

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new('Submarine', 2)
    @player_board = Board.new
    @computer_board = Board.new
    @all_ships = [
      {name:"Cruiser", len:3},
      {name:"Submarine", len:2}
    ]

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


    for ship_details in @all_ships do
      ship = Ship.new(ship_details[:name], ship_details[:len])
      # require "pry"; binding.pry
      coordinates = []
      ship.length.times do
        puts "Choose your coordinate for #{ship.name}"
        cell_test = gets.chomp.capitalize
        until @player_board.valid_coordinate?(cell_test)
          puts "Sorry try again"
          cell_test = gets.chomp.capitalize
        end
        coordinates << cell_test
      end
      unless @player_board.valid_placement?(ship, coordinates)
        puts "What the fuck is wrong with you? Try again"
        start_game
      end
      @player_board.place(ship, coordinates)

      # require "pry"; binding.pry

    end

    def computer_keys
      @computer_board.cells.keys
    end

    def computer_place_ships
      potential = computer_keys
      for ship_details in @all_ships do
        until @computer_board.valid_placement?(ship, samples)
          samples = potential.sample(ship.length)
        end
        @computer_board.place(ship, samples)
        potential -= samples
        puts @computer_board.render(true)
      end
    end


        #pick coordinates
        #pick up or down
        #move stuff into an array after it has been used or just delete
        #where does this get valdiated?
        #where does this end up placing the ship


      # @computer_board.cells.keys.sample(2)
      # until computer_board.valid_placement?(ship,coordinates)



      # until @computer_board.valid_placement?(ship,coordinates)

    # puts "Your Board"
    # puts @player_board.render(true)
    # puts "Computer Board"
    # puts @computer_board.render


    puts "Your Board"
    puts @player_board.render(true)
    puts "Computer Board"
    puts @computer_board.render(true)
    require "pry"; binding.pry


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
