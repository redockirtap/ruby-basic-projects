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
