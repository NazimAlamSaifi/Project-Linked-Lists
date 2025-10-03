class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      tail.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
    current = @head
    return nil if current.nil?
    current = current.next_node while current.next_node
    current
  end

  def at(index)
    current = @head
    count = 0
    while current
      return current if count == index
      count += 1
      current = current.next_node
    end
    nil
  end

  def pop
    return nil if @head.nil?
    return @head = nil if @head.next_node.nil?

    current = @head
    current = current.next_node while current.next_node.next_node
    current.next_node = nil
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    current = @head
    str = ""
    while current
      str += "( #{current.value} ) -> "
      current = current.next_node
    end
    str += "nil"
  end
end


#//////// TEST ////////#
list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list.head.value
puts list.head.next_node.value
puts list.find('cat')
puts list.find('fox')

puts list