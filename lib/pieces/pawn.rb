require_relative './piece'

class Pawn < Piece
  def set_symbol
    color == :white ? '♙' : '♟︎'
  end

  def moves
    moves = []
    row, col = position

    dir = color == :white ? 1 : -1

    forward_one = [row + dir, col]
    if valid_pos?(forward_one) && board.piece_at(forward_one).nil?
      moves << forward_one

      start_row = color == :white ? 1 : 6
      forward_two = [row + 2 * dir, col]

      if row == start_row &&
         valid_pos?(forward_two) &&
         board.piece_at(forward_two).nil?
        moves << forward_two
      end
    end
    [[dir, -1], [dir, 1]].each do |drow, dcol|
      new_pos = [row + drow, col + dcol]
      next unless valid_pos?(new_pos)

      target = board.piece_at(new_pos)
      moves << new_pos if target && target.color != color
    end
    moves
  end
end
