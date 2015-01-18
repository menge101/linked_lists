require 'minitest/autorun'
require 'ruby-prof'
require_relative 'linked_lists'

class LinkedListTest < MiniTest::Test
  def test_init
    assert LinkedList.new
    assert LinkedList.new(%w(12 13 15 44 52 67 89))
    assert_raises(ArgumentError) { LinkedList.new(3)}
    assert LinkedList.new([3])
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
    y = %w(1 2)
    x = LinkedList.new(y)
    assert x.values, y

    y = %w(12 13 15 44 52 67 89)
    x = LinkedList.new(y)
    assert x.values, y
  end

  def test_reverse
    x = LinkedList.new()
    assert_equal [], x.reverse.values

    y = [1]
    x = LinkedList.new(y)
    assert_equal y, x.reverse.values

    y = [1,2]
    x = LinkedList.new(y)
    assert_equal y.reverse, x.reverse.values

    y = [12,13,15,44,52,67,89]
    x = LinkedList.new(y)
    assert_equal y.reverse, x.reverse.values
  end

  def test_reverse_stacked_bang
    x = LinkedList.new()
    assert_equal [], x.reverse_stacked!.values

    y = [1]
    x = LinkedList.new(y)
    assert_equal y, x.reverse_stacked!.values

    y = [1,2]
    x = LinkedList.new(y)
    assert_equal y.reverse, x.reverse_stacked!.values

    y = [12,13,15,44,52,67,89]
    x = LinkedList.new(y)
    assert_equal y.reverse, x.reverse_stacked!.values
  end

  def test_reverse_recursive_bang
    x = LinkedList.new()
    assert_equal [], x.reverse_recursive!.values

    y = [1]
    x = LinkedList.new(y)
    assert_equal y, x.reverse_recursive!.values

    y = [1,2]
    x = LinkedList.new(y)
    assert_equal y.reverse, x.reverse_recursive!.values

    y = [12,13,15,44,52,67,89]
    x = LinkedList.new(y)
    assert_equal y.reverse, x.reverse_recursive!.values
  end

  def test_include?
    y = [12,13,15,44,52,67,89]
    x = LinkedList.new(y)
    assert_raises(ArgumentError) { x.include?(LinkedList.new(%w(2 3))) }
    assert x.include?(12)
    assert x.include?(52)
    refute x.include?(99)
  end

  def test_sort
    y = [12,13,15,44,52,67,89]
    x = LinkedList.new(y)
    assert_equal y.sort, x.sort.values
    assert_equal y, x.values
  end

  def test_remove
    y = [12,13,15,44,52,67,89]
    x = LinkedList.new(y)
    assert_equal [12,13,44,52,67,89], x.remove(2).values
    assert_equal y, x.values
  end

  def test_remove_bang
    y = [12,13,15,44,52,67,89]
    x = LinkedList.new(y)
    assert_equal 15, x.remove!(2)
    refute x.include?(15)
    assert_equal [12,13,44,52,67,89], x.values
    assert_equal 12, x.remove!(0)
    refute x.include?(12)
    assert_equal [13,44,52,67,89], x.values
  end

  #uncomment to run profiling
  #def test_ruby_prof_profiling
  #  y = (1 .. 999)
  #  x = LinkedList.new(y)
  #  RubyProf.start
  #  30.times do
  #    x.reverse_stacked!
  #    x.reverse_recursive!
  #  end
  #  result = RubyProf.stop
  #  printer = RubyProf::MultiPrinter.new(result)
  #  printer.print(:path => ".", :profile => "profile")
  #end
end