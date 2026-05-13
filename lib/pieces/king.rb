require_relative './piece'
require_relative '../modules/stepping_piece'

class King < Piece
  include SteppingPiece

  def move_directions
    [
      [1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end

  def set_symbol
    color == :white ? '♔' : '♚'
  end
end
