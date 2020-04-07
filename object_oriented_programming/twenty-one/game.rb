require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def display_cards
    system 'clear'
    @player.show_hand
    @dealer.show_hand
  end

  def show_busted
    if player.busted?
      puts "It looks like #{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "It looks like #{dealer.name} busted! #{player.name} wins!"
    end
  end

  def show_result
    if player.total > dealer.total
      puts "#{player.name} wins!"
    elsif player.total < dealer.total
      puts "#{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Invalid answer, please enter y or n"
    end

    answer == 'y'
  end

  def player_turn
    puts "It's #{player.name}'s turn"

    loop do
      puts "Would you like to (h)it or (s)tay?"
      answer = nil
      loop do
        answer = gets.chomp.downcase
        break if ['h', 's'].include? answer
        puts "Sorry, must choose 'h' or 's'."
      end

      if answer == 's'
        puts "#{player.name} chose to stay!"
        break
      elsif player.busted?
        break
      else
        player.add_card(deck.deal)
        puts "#{player.name} hits!"
        player.show_hand
        break if player.busted?
      end
    end
  end

  def dealer_turn
    puts "#{dealer.name}'s turn..."

    loop do
      if dealer.total == 17 && !dealer.busted?
        puts "#{dealer.name} stays!"
        break
      elsif dealer.busted?
        break
      else
        puts "#{dealer.name} hits!"
        dealer.add_card(deck.deal)
      end
    end
  end

  def start
    loop do
      # deal_cards
      2.times do
        player.add_card(deck.deal)
        dealer.add_card(deck.deal)
      end
      # show_initial_cards
      display_cards

      # player_turn
      player_turn
      if player.busted?
        show_busted
        break unless play_again?
        reset
        next
      end

      # dealer_turn
      dealer_turn
      if dealer.busted?
        show_busted
        break unless play_again?
        reset
        next
      end

      # show_result
      display_cards
      show_result
      play_again? ? reset : break
    end

    puts 'Thanks for playing, sucka. Peace!'
  end
end

Game.new.start
