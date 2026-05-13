module SlidingPiece
  def moves
    possible_moves = []

    move_directions.each do |(dx, dy)|
      current_row, current_col = position

      loop do
        current_row += dx
        current_col += dy
        new_pos = [current_row, current_col]

        break unless valid_pos?(new_pos)

        piece_at_pos = board.piece_at(new_pos)

        if piece_at_pos.nil?
          possible_moves << new_pos
        elsif piece_at_pos.color != color
          possible_moves << new_pos
          break
        else
          break
        end
      end
    end
    possible_moves
  end
end
