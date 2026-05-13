require_relative 'board'

class Game
  attr_reader :board, :current_player

  def initialize
    @board = Board.new
    @current_player = :white
  end

  def play
    puts 'Welcome to Ruby Chess!'
    loop do
      board.show_board
      puts "\n#{current_player.capitalize}'s turn"

      from = get_pos("Select a piece to move (e.g. '6 0')")
      piece = board.piece_at(from)
      unless piece && piece.color == current_player
        puts 'Invalid selection! Try again.'
        next
      end

      puts "Available moves: #{piece.moves.inspect}"
      to = get_pos("Select destination (e.g. '4 0')")

      begin
        board.move_piece(from, to)
      rescue StandardError => e
        puts "Error: #{e.message}"
        next
      end

      switch_player
    end
  end

  private

  def get_pos(prompt)
    print "#{prompt}: "
    input = gets.chomp.strip
    numbers = input.include?(' ') ? input.split.map(&:to_i) : input.chars.map(&:to_i)
    unless numbers.length == 2 && numbers.all? { |n| n.between?(0, 7) }
      puts "Invalid input! Please enter two digits between 0 and 7 (like '6 0' or '60')."
      return get_pos(prompt)
    end
    numbers
  end

  def switch_player
    @current_player = current_player == :white ? :black : :white
  end
end
