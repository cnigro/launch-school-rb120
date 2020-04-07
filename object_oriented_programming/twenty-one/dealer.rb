class Dealer < Player
  def initialize
    @cards = []
    @name = 'Dealer'
  end

  def show_hand
    puts "#{name}'s hand:"
    puts "hidden"
    cards[1..-1].each do |card|
      puts card
    end
    puts "\tTotal: unknown"
  end
end
