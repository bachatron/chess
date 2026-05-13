module SteppingPiece
  def moves
    move_directions.map do |(dx, dy)|
      row, col = position
      new_pos = [row + dx, col + dy]
      next unless valid_pos?(new_pos)

      piece_at_pos = board.piece_at(new_pos)
      next if piece_at_pos && piece_at_pos.color == color

      new_pos
    end.compact
  end
end
