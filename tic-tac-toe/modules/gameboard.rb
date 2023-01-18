# frozen_string_literal: true

# Game board containing state of the cells and methods to change it
class GameBoard
  def initialize
    @board = [*1..9]
  end

  def board
    @board.clone.freeze
  end

  def add_marker(marker, cell)
    @board[cell] = marker
  end

  def reset
    @board = [*1..9]
  end
end
