# Complete this program so that it produces the expected output:

class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What are the differences between attr_reader, attr_writer, and attr_accessor?
# Why did we use attr_reader instead of one of the other two? Would it be okay
# to use one of the others? Why or why not?

# Instead of attr_reader, suppose you had added the following methods to this
# class:

# def title
  # @title
# end

# def author
  # @author
# end

# Would this change the behavior of the class in any way? If so, how?
# If not, why not? Can you think of any advantages of this code?

# We chose attr_reader, because we're only reading the value of @author and
# @title. If we wanted to be able to change these values but not read them,
# we would choose attr_writer. If we wanted to read and write, we would choose
# attr_accessor, so ruby would generate accessor and mutator methods. 
# We could write the methods ourselves and the program would function as
# desired. ruby just provides us with some syntactic sugar. 
