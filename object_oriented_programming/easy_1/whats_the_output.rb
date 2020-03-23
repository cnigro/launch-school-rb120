# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    # @name.upcase! <-- remove this line and add non-mutating call to line 12
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# What output does this code print? Fix this class so that there are no
# surprises waiting in store for the unsuspecting developer.

# As written, the class mutates the name object, so any subsequent call to
# #name returns an unexpected value. We can fix it by deleting the destructive
# call to #upcase!, and call #upcase on the @name instance variable inside
# of our string interpolation. Now, all is working as expected.
