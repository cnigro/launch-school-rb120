require_relative 'board'
require_relative 'player'

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer, :score

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @score = {@human => 0, @computer => 0}
  end

  def reset
    board.reset
    @current_maker = FIRST_TO_MOVE
    clear
    puts "Let's play again!\n"
  end

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Let's play some Tic Tac Toe!\n"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe!\n"
  end

  def joinor(list, delimiter=', ', conjunction='or')
    if list.size < 3
      list.join(" #{conjunction} ")
    else
      list[-1] = "#{conjunction} #{list.last}"
      list.join(delimiter)
    end
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}\n"
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)})"
    square = nil

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    if board.vulnerable
      board.vulnerable.marker = computer.marker
    elsif board.unmarked_keys.include?(5)
      board[5] = computer.marker
    else 
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def round_winner
    case board.winning_marker
    when HUMAN_MARKER then @human
    when COMPUTER_MARKER then @computer
    else nil
    end
  end

  def game_winner
    if score[@computer] == 5
      @computer
    elsif score[@human] == 5
      @human
    else
      nil
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when HUMAN_MARKER then puts "You won!"
    when COMPUTER_MARKER then puts "Computer won!"
    else puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def increment_score(player)
    score[player] += 1 if player
  end

  def display_score
    puts "Your score: #{score[@human]}, Computer score: #{score[@computer]}"
  end

  def play
    clear
    display_welcome_message

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end

      display_result
      increment_score(round_winner)
      display_score
      break unless !game_winner && play_again? 
      reset
    end

    display_goodbye_message
  end
end

# Run the game
game = TTTGame.new
game.play
