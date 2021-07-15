require './lib/board'
require "pry"

RSpec.describe Board do

  it 'is a board' do
    board = Board.new
    expect(board).to be_a(Board)
    binding.pry
  end
end
