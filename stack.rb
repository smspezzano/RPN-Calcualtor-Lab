# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!
class Node
  attr_accessor :next, :previous, :value
  def initialize(value)
    @value = value
  end 
end

class Stack

  attr_reader :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
  def push(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      old_tail = @tail
      @tail = Node.new(value)
      old_tail.next = @tail
      @tail.previous = old_tail
    end
    @length += 1
  end

  # Returns the value that is popped off
  # or nil if none exists
  def pop
    if @length == 0
      return nil
    elsif @length == 1
      last_tail = @tail
      @tail = nil
      @head = nil
      @length = 0
      return last_tail.value
    else     
      last_tail = @tail
      @tail = @tail.previous
      @tail.next = nil
      @length -= 1
      last_tail.value
    end
  end

end
