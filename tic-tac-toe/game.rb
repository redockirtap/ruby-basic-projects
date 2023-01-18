# frozen_string_literal: true

require_relative 'modules/controller'
require_relative 'modules/gameboard'
require_relative 'modules/display'

gameboard = GameBoard.new
controller = Controller.new(gameboard)
controller.run_game
