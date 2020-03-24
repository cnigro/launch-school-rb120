# Write a class that will display:
# ABC
# xyz

class Transform
  attr_accessor :text

  def initialize(text)
    @text = text
  end

  def uppercase
    text.upcase
  end

  def self.lowercase(value)
    value.downcase
  end
end

# when the following code is run:
my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
