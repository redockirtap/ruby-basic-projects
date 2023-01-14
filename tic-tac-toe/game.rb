
class ChessBoard

	@@board = ["__", "__", "__",
	"__", "__", "__",
	"__", "__", "__"]

	def initialize
		#
	end

	# def self.board
	# 	@@board
	# end

	def self.add_marker
		@@board[0] = "A"
	end
end

class Player
	def initialize(name, marker)
		@name = name
		@marker = marker
	end
end

first_player = Player.new("Player 1", "X")
second_player = Player.new("Player 2", "O")

p ChessBoard.add_marker
p ChessBoard.board
