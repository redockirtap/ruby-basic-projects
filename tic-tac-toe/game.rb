# frozen_string_literal: true

require_relative 'modules/controller'
require_relative 'modules/gameboard'
require_relative 'modules/display'

controller = Controller.new
gameboard = GameBoard.new
controller.run_game(gameboard)
