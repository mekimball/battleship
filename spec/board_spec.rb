require './lib/board'
require "pry"

RSpec.describe Board do

  it 'is a board' do
    board = Board.new
    expect(board).to be_a(Board)
    expect(board.cells).to be_a(Hash)
    # binding.pry
  end

  it 'checks valid coordinates' do
    board = Board.new
    # binding.pry
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end
end
