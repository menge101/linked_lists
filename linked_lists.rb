class Node
  attr_accessor :value, :next

  def initialize(value, next_node=nil)
    @value = value.to_i
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(elements=nil)
    @head = nil
    elements.each {|value| add(value.to_i)} if elements
  end

  def add(value)
    if @head
      find_tail(@head).next = Node.new(value.to_i)
    else
      @head = Node.new(value.to_i)
    end
  end

  def values(start_node=@head)
    return_array ||= Array.new
    unless start_node.nil?
      return_array << start_node.value
      return_array += values(start_node.next)
    end
    return_array
  end

  #Standard ruby-esque method that returns a new object that
  # is the reversed list without altering the original object
  def reverse(current_node=@head)
    LinkedList.new(values(current_node).reverse)
  end

  def reverse!(current_node=@head)
    return self if current_node.nil?
    reverser = Array.new
    @head = nil

    #deconstruct list, pushing nodes to stack
    until current_node.next.nil?
      next_node = current_node.next
      current_node.next = nil
      reverser.push current_node
      current_node = next_node
    end
    @head = current_node
    until reverser.empty?
      current_node.next = reverser.pop
      current_node = current_node.next
    end
    self
  end

  def reverse_recursive!(current_node=@head)
    return self if current_node.nil?
    last_node = current_node
    rev_rec(current_node)
    last_node.next = nil
    self
  end

  def include?(value)
    raise ArgumentError unless value.respond_to?(:to_i)
    current_node = @head
    return_value = false
    until current_node.nil?
      if current_node.value == value
        return_value = true
        break
      else
        current_node = current_node.next
      end
    end
    return_value
  end

  def sort
    LinkedList.new(values.sort)
  end

  private
  # This method performs the guts of a recursive reverse function
  # it is used by the reverse_recursive! method
  def rev_rec(current_node=@head)
    if current_node.next.nil?
      @head = current_node
      current_node
    else
      rev_rec(current_node.next).next = current_node
    end
  end

  def find_tail(start_node)
    if start_node.next.nil?
      start_node
    else
      find_tail(start_node.next)
    end
  end
end