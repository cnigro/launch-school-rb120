# Create an object-oriented number guessing class for numbers in the range 1 to
# 100, with a limit of 7 guesses per game. The game should play like this:

class GuessingGame
  TOTAL_GUESSES = 7

  def initialize
    @number = nil
  end

  def reset
    @number = rand(1..100)
  end

  def valid?(guess)
    (1..100).cover? guess
  end

  def play
    reset
    puts "Try to guess the number"
    TOTAL_GUESSES.downto(1) do |guesses|
      puts "You have #{guesses} remaining"
      puts "Enter a number between 1 and 100:"
      guess = nil
      loop do
        guess = gets.chomp.to_i
        break if valid? guess 
        puts "Invalid guess. Enter a number between 1 and 100:"
      end
      if guess < @number
        puts "Your guess is too low."
      elsif guess > @number
        puts "Your guess is too high."
      else
        puts "That's the number!\n\nYou won!"
        return
      end
    end
    puts "You have no more guesses. You lost!"
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!

# Note that a game object should start a new game with a new number to guess
# with each call to #play.
