# rubocop:disable all

class Display
  def self.display
    puts "_#{GameBoard.board[0]}_|_#{GameBoard.board[1]}_|_#{GameBoard.board[2]}_" 
    puts "_#{GameBoard.board[3]}_|_#{GameBoard.board[4]}_|_#{GameBoard.board[5]}_"
    puts " #{GameBoard.board[6]} | #{GameBoard.board[7]} | #{GameBoard.board[8]} "
  end
end


Display.display