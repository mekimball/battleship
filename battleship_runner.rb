require './lib/game'
require './lib/board'
require './lib/cell'
require './lib/ship'

board = Board.new
cruiser = Ship.new('cruiser', 3)
submarine = Ship.new('submarine', 2)
game = Game.new
game.start
