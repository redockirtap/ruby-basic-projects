# rubocop:disable all

class GameBoard

	@@board = 
	[1, 2, 3,
	4, 5, 6,
	7, 8, 9]

	def self.board
		@@board
	end

	def self.add_marker(marker, cell)
		@@board[cell] = marker
	end
end

class Player
	attr_reader :name, :marker

	def initialize(name, marker)
		@name = name
		@marker = marker
	end
end

class Controller
	# @@first_player = 'X'
	# @@second_player = 'O'
	# @@current_marker = nil

	def self.run_game

		@@first_player = 'X'
		@@second_player = 'O'
		@@current_marker = nil
		@@cell = nil

		while !Controller.draw? or !Controller.win?
			
			Controller.change_turn
			Controller.choose_cell
			while !Controller.freecell?(@@cell)
				Controller.choose_cell
			end
			Controller.add_marker(@@current_marker)
			p GameBoard.board, Controller.win?, @@current_marker
			# puts Display.display
		end

		p GameBoard.board

	end

	def self.change_turn 
		if @@current_marker == @@first_player
			@@current_marker = @@second_player
		else
			@@current_marker = @@first_player
		end
	end

	def self.win?
		case 
		when GameBoard.board[0..2].all?(@@current_marker), # top row
			GameBoard.board[3..5].all?(@@current_marker), # middle row
			GameBoard.board[6..8].all?(@@current_marker), # bottom row
			GameBoard.board[(0..).step(3)].all?(@@current_marker), # first column
			GameBoard.board[(1..).step(3)].all?(@@current_marker), # second column
			GameBoard.board[(2..).step(3)].all?(@@current_marker), # third column
			GameBoard.board[(0..).step(4)].all?(@@current_marker), # first diagonal
			GameBoard.board[(2..).step(2)].all?(@@current_marker) # second diagonal
			true
		else
			false
		end
	end

	def self.draw?
		GameBoard.board.none?(/\d/)
	end

	def self.freecell?(cell)
		GameBoard.board[cell].class == Integer
	end

	def self.choose_cell
		puts "Choose a cell to place #{@@current_marker} marker."
		@@cell = gets.chomp.to_i - 1
		Controller.choose_cell if !@@cell.between?(0, 9)
	end

	def self.add_marker(marker)
		GameBoard.add_marker(@@current_marker, @@cell)
	end

end

class Display
  def self.display
    puts "_#{GameBoard.board[0]}_|_#{GameBoard.board[1]}_|_#{GameBoard.board[2]}_" 
    puts "_#{GameBoard.board[3]}_|_#{GameBoard.board[4]}_|_#{GameBoard.board[5]}_"
    puts " #{GameBoard.board[6]} | #{GameBoard.board[7]} | #{GameBoard.board[8]} "
  end
end

Controller.run_game

# p GameBoard.board.none?(/\d/)
# p Controller.win?

# p Controller.freecell?(1)
# p !Controller.draw?
# p !Controller.win?