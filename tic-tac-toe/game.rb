
class ChessBoard

	@@board = 
	["__", "__", "__",
	"__", "__", "__",
	"__", "__", "__"]

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
	attr_reader :marker

	def initialize(name, marker)
		@name = name
		@marker = marker
	end
end

class Controller
	@@first_player = "X"
	@@second_player = "Y"

	def self.start_game
		puts "Choose a marker for the first Player."
		@@first_player = Player.new("Player 1", gets.chomp)

		puts "Choose a marker for the second Player."
		@@second_player = Player.new("Player 2", gets.chomp)
	end

	def self.win?
		# ChessBoard.board 
	end

	def self.draw?

	end

	def self.freecell?

	end

	def self.add_marker(marker)
		puts "choose a cell to place your marker."
		cell = gets.chomp.to_i
		ChessBoard.add_marker(marker, cell)
		ChessBoard.board.map.with_index { |marker, cell| p marker, cell+1 }
	end

end


Controller.start_game
p Controller.add_marker("X")
p Controller.add_marker("Y")

p ChessBoard.board
