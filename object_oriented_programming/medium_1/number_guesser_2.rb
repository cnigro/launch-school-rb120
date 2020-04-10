# In the previous exercise, you wrote a number guessing game that determines a
# secret number between 1 and 100, and gives the user 7 opportunities to guess
# the number.

# Update your solution to accept a low and high value when you create a
# GuessingGame object, and use those values to compute a secret number for
# the game. You should also change the number of guesses allowed so the user
# can always win if she uses a good strategy. You can compute the number of
# guesses with:

# Math.log2(size_of_range).to_i + 1

class GuessingGame
  def initialize(lower_bound, upper_bound)
    @number = nil
    @guesses = nil
    @lower_bound = lower_bound
    @upper_bound = upper_bound
  end

  def reset
    @number = rand(@lower_bound..@upper_bound)
    @guesses = Math.log2(@upper_bound - @lower_bound).to_i + 1
  end

  def valid?(guess)
    (@lower_bound..@upper_bound).cover? guess
  end

  def play
    reset
    puts "Try to guess the number"
    @guesses.downto(1) do |guesses|
      puts "You have #{guesses} remaining"
      puts "Enter a number between #{@lower_bound} and #{@upper_bound}:"
      guess = nil
      loop do
        guess = gets.chomp.to_i
        break if valid? guess 
        puts "Invalid guess. Enter a number between #{@lower_bound} and #{@upper_bound}:"
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

game = GuessingGame.new(501, 1500)
game.play