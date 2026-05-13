require_relative './piece'
require_relative '../modules/stepping_piece'

class Knight < Piece
  include SteppingPiece

  def move_directions
    [
      [2, 1], [1, 2], [-1, 2], [-2, 1],
      [-2, -1], [-1, -2], [1, -2], [2, -1]
    ]
  end

  def set_symbol
    color == :white ? '♘' : '♞'
  end
end
