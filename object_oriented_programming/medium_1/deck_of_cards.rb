# Using the Card class from the previous exercise, create a Deck class that
# contains all of the standard 52 playing cards. Use the following code to
# start your work:

class Card
  include Comparable
  attr_reader :rank, :suit

  NON_NUMERIC_VALUE = {
    'Jack'  => 11,
    'Queen' => 12,
    'King'  => 13,
    'Ace'   => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    left = self.rank.is_a?(Integer) ? self.rank : NON_NUMERIC_VALUE[self.rank]
    right = other.rank.is_a?(Integer) ? other.rank : NON_NUMERIC_VALUE[other.rank]
    left <=> right
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    generate_deck
  end

  def generate_deck
    @deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def draw
    generate_deck if @deck.empty?
    @deck.pop
  end
end

# The Deck class should provide a #draw method to deal one card. The Deck
# should be shuffled when it is initialized and, if it runs out of cards, it
# should reset itself by generating a new set of 52 shuffled cards.

# Examples:
deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.

# Note that the last line should almost always be true; if you shuffle the deck
# 1000 times a second, you will be very, very, very old before you see two
# consecutive shuffles produce the same results. If you get a false result, you
# almost certainly have something wrong.
