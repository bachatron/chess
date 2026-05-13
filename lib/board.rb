require_relative './pieces/pawn'
require_relative './pieces/bishop'
require_relative './pieces/king'
require_relative './pieces/knight'
require_relative './pieces/queen'
require_relative './pieces/rook'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
    setup_board if respond_to?(:setup_board)
  end

  def setup_board
    # Pawns
    8.times do |col|
      grid[1][col] = Pawn.new(:white, [1, col], self)
      grid[6][col] = Pawn.new(:black, [6, col], self)
    end

    # Rooks
    grid[0][0] = Rook.new(:white, [0, 0], self)
    grid[0][7] = Rook.new(:white, [0, 7], self)
    grid[7][0] = Rook.new(:black, [7, 0], self)
    grid[7][7] = Rook.new(:black, [7, 7], self)

    # Knights
    grid[0][1] = Knight.new(:white, [0, 1], self)
    grid[0][6] = Knight.new(:white, [0, 6], self)
    grid[7][1] = Knight.new(:black, [7, 1], self)
    grid[7][6] = Knight.new(:black, [7, 6], self)

    # Bishops
    grid[0][2] = Bishop.new(:white, [0, 2], self)
    grid[0][5] = Bishop.new(:white, [0, 5], self)
    grid[7][2] = Bishop.new(:black, [7, 2], self)
    grid[7][5] = Bishop.new(:black, [7, 5], self)

    # Queens
    grid[0][3] = Queen.new(:white, [0, 3], self)
    grid[7][3] = Queen.new(:black, [7, 3], self)

    # Kings
    grid[0][4] = King.new(:white, [0, 4], self)
    grid[7][4] = King.new(:black, [7, 4], self)
  end

  def piece_at(pos)
    row, col = pos
    grid[row][col]
  end

  def move_piece(from_pos, to_pos)
    raise 'Invalid from position' unless valid_pos?(from_pos)
    raise 'Invalid to position' unless valid_pos?(to_pos)

    piece = piece_at(from_pos)
    raise 'No piece at from_pos' if piece.nil?

    legal_moves = piece.moves
    raise "Illegal move for #{piece.class} from #{from_pos} to #{to_pos}" unless legal_moves.include?(to_pos)

    target = piece_at(to_pos)
    grid[to_pos[0]][to_pos[1]] = piece
    grid[from_pos[0]][from_pos[1]] = nil
    piece.instance_variable_set(:@position, to_pos)

    target
  end

  def valid_pos?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  def show_board
    grid.each do |row|
      puts row.map { |cell| cell.nil? ? '.' : cell.symbol }.join(' ')
    end
  end
end
