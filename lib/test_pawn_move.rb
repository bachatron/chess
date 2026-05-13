require_relative 'board'
require_relative 'pieces/pawn'
# require other necessary piece files if your board.setup_board uses them

board = Board.new
# place a white pawn manually for quick test
pawn = Pawn.new(:white, [1, 4], board)
board.grid[1][4] = pawn

# print available moves then move
p pawn.moves # expect [[2,4], [3,4]] (if path clear)
board.move_piece([1, 4], [3, 4])
board.show_board
