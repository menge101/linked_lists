#Linked Lists

This is a basic Linked List data object.  I created this to experiment with linked Lists.

## Methods

### :new

  LinkedList.new - Creates a Linked List with zero nodes

  LinkedList.new([2,3,4]) - Takes an Array as an argument, creates a node for each element of the Array.

### :add

  a = LinkedList.new

  a.add(7) - Adds a new node to the tail of the LInked LIst with value passed as an argument
  returns self

### :values

  a = LinkedList.new([2,5,1,3,2,5,6,7])

  a.values => [2,5,1,3,2,5,6,7]

### :reverse

  Makes a copy of the Array and reverses it, returns the new Linked List.

  a = LinkedList.new([2,5,1,3,2,5,6,7])

  a.reverse.values => [7,6,5,2,3,1,5,2]

  a.values => [2,5,1,3,2,5,6,7]


### :reverse!, :reverse_recursive!, :reverse_stacked!

#### :reverse! is an alias for :reverse_recursive!

  Reverse Linked List in place, returns self

  a = LinkedList.new([2,5,1,3,2,5,6,7])

  a.reverse!.values => [7,6,5,2,3,1,5,2]

  a.values => [7,6,5,2,3,1,5,2]

### :include?

  Takes a value as an argument returns true if value is in the list, false if not

  a = LinkedList.new([2,5,1,3,2,5,6,7])

  a.include?(22) => false

  a.include?(5) => true


### :sort

  Creates a new object while sorting the Linked List

  a = LinkedList.new([2,5,1,3,2,5,6,7])

  a.sort.values => [1,2,2,3,5,5,6,7])

  a.values => [2,5,1,3,2,5,6,7]

### :remove

  Takes a number (n) as an argument, creates a new Linked List,
  sans the nth node.  'First' node is numbered zero.

  a = LinkedList.new([2,5,1,3,2,5,6,7])

  a.remove(3).values => [2,5,1,2,5,6,7]

  a.values => [2,5,1,3,2,5,6,7]

### :remove!

  Takes a number (n) as an argument, removes the the nth node.
  'First' node is numbered zero.

  a = LinkedList.new([2,5,1,3,2,5,6,7])

  a.remove(3).values => [2,5,1,2,5,6,7]

  a.values => [2,5,1,2,5,6,7]
