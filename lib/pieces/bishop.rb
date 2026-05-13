require_relative './piece'
require_relative '../modules/sliding_piece'

class Bishop < Piece
  include SlidingPiece

  def move_directions
    [
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end

  def set_symbol
    color == :white ? '♗' : '♝'
  end
end
