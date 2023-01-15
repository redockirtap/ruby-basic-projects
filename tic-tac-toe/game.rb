# rubocop:disable all

class GameBoard

	@@board = 
	[nil, nil, nil,
	nil, nil, nil,
	nil, nil, nil]

	def initialize
		#
	end

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
	@@first_player = nil
	@@second_player = nil
	@@current_marker = 'X'

	def self.start_game
		puts "Choose a marker for the first Player."
		@@first_player = Player.new("Player 1", gets.chomp)

		puts "Choose a marker for the second Player."
		@@second_player = Player.new("Player 2", gets.chomp)
	end

	def self.change_turn 
		if @@current_marker == @@first_player.marker
			@@current_marker = @@second_player.marker
		else
			@@current_marker = @@first_player.marker
		end
	end

	def self.win?
		p GameBoard.board[0..2].all?(@@current_marker) # top row
		p GameBoard.board[3..5].all?(@@current_marker) # middle row
		p GameBoard.board[6..8].all?(@@current_marker) # bottom row

		p GameBoard.board[(0..).step(3)].all?(@@current_marker) # first column
		p GameBoard.board[(1..).step(3)].all?(@@current_marker) # second column
		p GameBoard.board[(2..).step(3)].all?(@@current_marker) # third column

		p GameBoard.board[(0..).step(4)].all?(@@current_marker) # first diagonal
		p GameBoard.board[(2..).step(2)].all?(@@current_marker) # second diagonal

		p @@current_marker
	end

	def self.draw?
		GameBoard.board.none?(nil)
	end

	def self.freecell?(cell)
		GameBoard.board[cell] == nil
	end

	def self.add_marker(marker)
		puts "Choose a cell to place #{marker} marker."
		cell = gets.chomp.to_i
		GameBoard.add_marker(marker, cell)
	end

end

Controller.start_game
Controller.add_marker("X")
Controller.add_marker("X")
Controller.add_marker("X")

p Controller.win?
p GameBoard.board
