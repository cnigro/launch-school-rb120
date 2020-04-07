require_relative 'hand'

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end

  def set_name
    name = ''
    loop do
      puts "Tell me your name:"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value"
    end
    self.name = name
  end

  def show_hand
    show
  end
end
