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
    @secret = []
    @guesses = []
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
end

# Breaker of the code
class CodeBreaker
  def initialize(codebreaker)
    @codebreaker = codebreaker
  end
end

# Displaying the game in the console
class Display
  def initialize
    @display
  end
end

# Game logic, presentaion control
class GameController
  def initialize(codebreaker)
    @turns = -1
    @codebreaker = codebreaker
  end

  def run
    # run game loop
  end

  def who_breaks?
    # if player, then call one logic
    # if computer, then call another
  end
end
