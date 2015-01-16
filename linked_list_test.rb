require 'minitest/autorun'
require_relative 'linked_lists'

class LinkedListTest < MiniTest::Test
  def test_init
    x = LinkedList.new
    assert x

    x = LinkedList.new(%w(12 13 15 44 52 67 89))
    assert x
  end

  def test_add
    x = LinkedList.new
    assert x.add(25)
    assert_equal x.head.value, 25

    assert x.add(11)
    latest_node = x.head.next
    assert_equal latest_node.value, 11

    assert x.add(33)
    latest_node = latest_node.next
    assert_equal latest_node.value, 33
  end

  def test_values
    y = %w(12 13 15 44 52 67 89)
    x = LinkedList.new(y)
    assert x.values, y
  end

  def test_reverse
    x = LinkedList.new()
    assert_equal x.reverse!.values, []

    y = %w(1)
    x = LinkedList.new(y)
    assert_equal y, x.reverse!.values

    y = %w(1 2)
    x = LinkedList.new(y)
    assert_equal y, x.reverse!.values

    y = %w(12 13 15 44 52 67 89)
    x = LinkedList.new(y)
    assert_equal x.reverse!.values, y.reverse
  end
end