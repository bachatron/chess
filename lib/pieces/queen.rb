require_relative './piece'

class Queen < Piece
  include SlidingPiece

  def move_directions
    [
      [1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end

  def set_symbol
    color == :white ? '♕' : '♛'
  end
end
