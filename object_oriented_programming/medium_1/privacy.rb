# Consider the following class:

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def switch_state
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

blender = Machine.new
p blender.switch_state
blender.start
p blender.switch_state
blender.stop
p blender.switch_state

# Modify this class so both flip_switch and the setter method switch= are private
# methods.

# Further Exploration
# Add a private getter for @switch to the Machine class, and add a method to
# Machine that shows how to use that getter.