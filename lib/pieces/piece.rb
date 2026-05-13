class Piece
  attr_reader :color, :position, :symbol, :board

  def initialize(color, position, board)
    @color = color
    @position = position
    @board = board
    @symbol = set_symbol
  end

  def set_symbol
    raise NotImplementedError, 'Subclasses must implement #set_symbol'
  end

  def valid_pos?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end
end
