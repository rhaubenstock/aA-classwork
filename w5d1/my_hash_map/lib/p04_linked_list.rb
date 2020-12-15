class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next 
    self.next.prev = self.prev 
  end
end

# ptr -> nil ; add a node =>  ptr -> first_node ; 
# add another node; ptr -> first_node -> second_node -> ...

# ptr -> sentinal_node (has nil value, nil key, nil prev)
# add a node:
# ptr -> sentinal_node -> first_node
#
#
# use sentinal nodes for head and tail -> they never get deleted/removed
#

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    first == @tail
  end

  def get(key)
    #have to check each node, 1 by 1
    # don't need to check head and tail
    current_node = first
    while current_node != @tail
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end
    #implicitly returns nil
  end

  def include?(key)
    current_node = first
    while current_node != @tail
      return true if current_node.key == key
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    # appends to the end
    # make new node
    new_node = Node.new(key, val)
    # set new node next of prev of tail
    last.next = new_node #last is tail.prev
    new_node.prev = last
    # set new node to prev of tail
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    # if node with given key is in linked list 
    # -> update value to new value
    each {|node| node.val = val if node.key == key}
  end

  def remove(key)
    each {|node| node.remove if node.key == key}
  end

  def each
    current_node = first
    while current_node != @tail
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
