# frozen_string_literal: true

# Game logic module with methods to start and restart the game,
# to check win or draw, to add markers to the board
class Controller
  def initialize(gameboard)
    @first_player = 'X'
    @second_player = 'O'
    @current_marker = nil
    @cell = nil
    @gameboard = gameboard
  end

  def run_game
    until draw? || win?
      change_turn
      choose_cell
      choose_cell until freecell?
      add_marker(@current_marker)
      puts Display.display(@gameboard)
    end
    end_game
  end

  private

  def change_turn
    if @current_marker == @first_player # rubocop: disable Style/ConditionalAssignment
      @current_marker = @second_player
    else
      @current_marker = @first_player
    end
  end

  def win?
    row_win? || col_win? || dia_win?
  end

  def row_win?
    @gameboard.board[0..2].all?(@current_marker) || # top row
      @gameboard.board[3..5].all?(@current_marker) || # middle row
      @gameboard.board[6..8].all?(@current_marker) # bottom row
  end

  def col_win?
    @gameboard.board[(0..).step(3)].all?(@current_marker) || # first column
      @gameboard.board[(1..).step(3)].all?(@current_marker) || # second column
      @gameboard.board[(2..).step(3)].all?(@current_marker) # third column
  end

  def dia_win?
    @gameboard.board.values_at(0, 4, 8).all?(@current_marker) || # first diagonal
      @gameboard.board.values_at(2, 4, 6).all?(@current_marker) # second diagonal
  end

  def draw?
    @gameboard.board.none?(1..9)
  end

  def freecell?
    @gameboard.board[@cell].instance_of?(Integer)
  end

  def choose_cell
    puts "Choose a cell to place #{@current_marker} marker."
    @cell = gets.chomp.to_i - 1
    choose_cell unless @cell.between?(0, 9)
  end

  def add_marker(marker)
    @gameboard.add_marker(marker, @cell)
  end

  def end_game
    puts draw? ? "It's a draw. Another one? [y/n]: " : "#{@current_marker} won! One more? [y/n]: "
    @gameboard.reset && @current_marker = nil
    answer = gets.chomp.downcase
    answer == 'y' ? run_game : 'See you.'
  end
end
