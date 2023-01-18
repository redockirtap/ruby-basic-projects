# frozen_string_literal: true

# Displaying the Tic-Tac-Toe game in the console
class Display
  def self.display(gameboard)
    puts "_#{gameboard.board[0]}_|_#{gameboard.board[1]}_|_#{gameboard.board[2]}_"
    puts "_#{gameboard.board[3]}_|_#{gameboard.board[4]}_|_#{gameboard.board[5]}_"
    puts " #{gameboard.board[6]} | #{gameboard.board[7]} | #{gameboard.board[8]} "
  end
end
