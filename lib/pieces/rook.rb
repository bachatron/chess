require_relative './piece'
require_relative '../modules/sliding_piece'

class Rook < Piece
  include SlidingPiece

  def move_directions
    [
      [1, 0], [-1, 0], [0, 1], [0, -1]
    ]
  end

  def set_symbol
    color == :white ? '♖' : '♜'
  end
end
