module Hand
  def show
    puts "#{name}'s hand:"
    cards.each do |card|
      puts card
    end
    puts "\tTotal: #{total}"
  end

  def add_card(new_card)
    cards << new_card
  end

  def total
    sum = 0
    sum += cards.each do |card|
      if card.face == "Ace" then 11
      elsif ["Jack", "Queen", "King"].include?(card.face) then 10
      else card.face.to_i
      end
    end

    cards.select { |card| card == 'Ace' }.count.times do
      sum -= 10 if sum > 21
    end

    sum
  end

  def busted?
    total > 21
  end
end
