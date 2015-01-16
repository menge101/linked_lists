class Node
  attr_accessor :value, :next

  def initialize(value, next_node=nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(elements=nil)
    @head = nil
    elements.each {|value| add(value)} if elements
  end

  def add(value)
    if @head
      find_tail(@head).next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def values(start_node=@head)
    return_array = Array.new
    unless start_node.nil?
      return_array << start_node.value
      values(start_node.next)
    end
    return_array
  end

  def reverse!(current_node=@head)
    if current_node.nil?
      self
    elsif current_node.next.nil?

    else
    end


  end

  private
  def find_tail(start_node)
    if start_node.next.nil?
      start_node
    else
      find_tail(start_node.next)
    end
  end
end