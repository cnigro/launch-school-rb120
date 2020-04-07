require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    @cards = @cards.shuffle
  end

  def deal
    cards.pop
  end
end
