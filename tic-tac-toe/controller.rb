# frozen_string_literal: true

# Game logic module with methods to check win or draw, to add marker
class Controller
  def self.run_game
    @@first_player = 'X'
    @@second_player = 'O'
    @@current_marker = nil
    @@cell = nil

    until Controller.draw? || Controller.win?
      p Controller.draw?, Controller.win?
      Controller.change_turn
      Controller.choose_cell
      until Controller.freecell?(@@cell)
        Controller.choose_cell
      end
      Controller.add_marker(@@current_marker)
      # p GameBoard.board, Controller.win?, @@current_marker
      puts Display.display
    end

    Controller.end_game
  end

  def self.change_turn
    if @@current_marker == @@first_player
      @@current_marker = @@second_player
    else
      @@current_marker = @@first_player
    end
  end

  def self.win?
    # p GameBoard.board
    case 
    when GameBoard.board[0..2].all?(@@current_marker), # top row
      GameBoard.board[3..5].all?(@@current_marker), # middle row
      GameBoard.board[6..8].all?(@@current_marker), # bottom row
      GameBoard.board[(0..).step(3)].all?(@@current_marker), # first column
      GameBoard.board[(1..).step(3)].all?(@@current_marker), # second column
      GameBoard.board[(2..).step(3)].all?(@@current_marker), # third column
      GameBoard.board.values_at(0, 4, 8).all?(@@current_marker), # first diagonal
      GameBoard.board.values_at(2, 4, 6).all?(@@current_marker) # second diagonal
      true
    else
      false
    end
  end

  def self.draw?
    GameBoard.board.none?(1..9)
  end

  def self.freecell?(cell)
    GameBoard.board[cell].instance_of?(Integer)
  end

  def self.choose_cell
    puts "Choose a cell to place #{@@current_marker} marker."
    @@cell = gets.chomp.to_i - 1
    Controller.choose_cell unless @@cell.between?(0, 9)
  end

  def self.add_marker(marker)
    GameBoard.add_marker(marker, @@cell)
  end

  def self.end_game
    p Controller.draw?
    # puts "#{@@current_marker} won! One more? [y/n]: "
    puts Controller.draw? ? "It's a draw. Another one? [y/n]: " : "#{@@current_marker} won! One more? [y/n]: "
    GameBoard.reset
    answer = gets.chomp.downcase
    answer == 'y' ? Controller.run_game : 'See you.'
  end
end

# class Display
#   def self.display
#     puts "_#{GameBoard.board[0]}_|_#{GameBoard.board[1]}_|_#{GameBoard.board[2]}_" 
#     puts "_#{GameBoard.board[3]}_|_#{GameBoard.board[4]}_|_#{GameBoard.board[5]}_"
#     puts " #{GameBoard.board[6]} | #{GameBoard.board[7]} | #{GameBoard.board[8]} "
#   end
# end
