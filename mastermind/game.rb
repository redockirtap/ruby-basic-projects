# frozen_string_literal: true

# Computer randomly chooses from six colours
# Player makes a guess, and each turn computer returns hints
# Game is over after n tries, or if player wins

# 2 version: player chooses colours, and computer makes guesses

# Color Board that has color pallette and hints
class ColorBoard
  def initialize
    @default_colors = %w[red green yellow pink blue gray]
    @hints = %w[close exact wrong]
    @secret = 1234
    @guess = 4321 # optional
    @guesses = [] # optional
  end

  def hints
    @hints.clone.freeze
  end

  def guesses
    @guesses.clone.freeze
  end

  def add_guesses(hint)
    @guesses.push(hint)
  end

  def add_secret(secret)
    @secret.push(secret)
  end

  def check_guess(guess)
    @guesses.push(guess) # optional
    @guess
  end
end

# Breaker of the code
class CodeBreaker
  def initialize(codebreaker)
    @codebreaker = codebreaker
  end
end

# Displaying the game in the console
class Display
  # rubocop: disable Metrics/ParameterLists, Naming/MethodParameterName
  def initialize(c1, c2, c3, c4, h1, h2, h3, h4)
    # c stands for color, h - for hint
    @c1 = c1
    @c2 = c2
    @c3 = c3
    @c4 = c4
    @h1 = h1
    @h2 = h2
    @h3 = h3
    @h4 = h4
  end
  # rubocop: enable Metrics/ParameterLists, Naming/MethodParameterName

  def colorize
    # method to colorize the game
  end

  def preview
    puts %(
      ╔═══╤═══╤═══╤═══╤═══╤═══╗  ╔═══╤═══╤═══╤═══╗
      ║ 1 │ 2 │ 3 │ 4 │ 5 │ 6 ║  ║ 1 │ 2 │ 3 │ 4 ║
      ╚═══╧═══╧═══╧═══╧═══╧═══╝  ╚═══╧═══╧═══╧═══╝
    )
  end

  def display
    puts %(
      | Guess #1:        | Hint #1:
      ╔═══╤═══╤═══╤═══╗  ╔═══╤═══╤═══╤═══╗
      ║ 1 │ 2 │ 3 │ 4 ║  ║ 1 │ 2 │ 3 │ 4 ║
      ╚═══╧═══╧═══╧═══╝  ╚═══╧═══╧═══╧═══╝
    )
  end
end

# Game logic, presentaion control
class GameController
  def initialize(codebreaker)
    @turns = 0
    @codebreaker = codebreaker
  end

  def run
    # run game loop
  end

  def who_breaks?
    # if player, then call one logic
    # if computer, then call another
  end

  def make_guess
    # make a guess
  end
end

# Module with logic for player turns for GameContrller
module PlayerBreaker
  def make_guess
    # make a guess
    puts 'make a guess'
    guess = gets.chomp
    make_guess unless guess.match(/^[1-6]{4}$/)
    guess
  end
end

# Module with logic for computer turns for GameController
module ComputerBreaker
  def make_guess
    # make a guess
  end
end

# rubocop: disable all


