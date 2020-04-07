class Card
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
           'Jack', 'Queen', 'King', 'Ace']

  attr_reader :face

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{@face} of #{@suit}"
  end
end
