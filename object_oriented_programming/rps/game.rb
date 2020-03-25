require 'pry'
require 'pry-byebug'

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize
    @value = self.class.to_s.downcase
  end

  def >(other_move)
    self.class::WINNING_MOVES.include? other_move.to_s
  end

  def <(other_move)
    other_move.class::WINNING_MOVES.include? self.to_s
  end

  def to_s
    @value
  end
end

class Rock < Move
  WINNING_MOVES = ['scissors', 'lizard']
end

class Paper < Move
  WINNING_MOVES = ['rock', 'spock']
end

class Scissors < Move
  WINNING_MOVES = ['paper', 'lizard']
end

class Lizard < Move
  WINNING_MOVES = ['paper', 'spock']
end

class Spock < Move
  WINNING_MOVES = ['rock', 'scissors']
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = nil

    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts 'Sorry, must enter a value.'
    end

    self.name = n.capitalize
  end

  def choose
    choice = nil

    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, that's not a valid choice."
    end

    self.move = Object.const_get(choice.capitalize).new
  end
end

class Computer < Player
  def set_name
    self.name = ['R2-D2',
                 'Number 5',
                 'HAL',
                 'WOPR',
                 'Cortana',
                 'Siri',
                 'C-3PO'].sample
  end

  def choose
    self.move = Object.const_get(Move::VALUES.sample.capitalize).new
  end
end

class RPSGame
  attr_accessor :human, :computer, :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = {human => 0, computer => 0}
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing. Peace!"
  end

  def update_score(winner)
    score[winner] += 1
  end

  def winner?
    score[human] == 10 || score[computer] == 10
  end

  def display_score
    puts "\nScore".center(20)
    puts "--------------------"
    puts "#{human.name}: #{score[human]}, #{computer.name}: #{score[computer]}\n\n"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      update_score(human)
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      update_score(computer)
    else
      puts "It's a tie!"
    end
    display_score
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts 'Sorry, must choose y or n'
    end

    answer.downcase == 'y' ? true : false
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless !winner? && play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
