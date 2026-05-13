require_relative 'board'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/king'

board = Board.new
board.show_board

rook = Rook.new(:white, [4, 4], board)
knight = Knight.new(:black, [2, 3], board)
king = King.new(:white, [0, 0], board)
# board.grid[4][4] = rook
# board.grid[2][3] = knight
# board.grid[0][0] = king
#
# board.show_board
#
# puts 'Rook moves:'
# p rook.moves
#
# puts 'Knight moves:'
# p knight.moves
#
# puts 'King moves:'
# p king.moves
