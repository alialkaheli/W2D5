require 'byebug'
class Node
  
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  # def to_s
  #   "#{@key}: #{@val}"
  # end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    
  end
end

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
     @head.next == @tail
  end

  def get(key)
    node = first
    until node.key == key || node == @tail
      node = node.next
    end
    node.val
  end

  def include?(key)
    node = first
     until node.nil?
       return true if node.key == key
       node = node.next
     end
     false
  end

  def append(key, val)
    new_node = Node.new(key,val)
    x = @tail.prev
    new_node.prev = x
    x.next = new_node
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    node = first
    until node.key == key || node == @tail
      node = node.next
    end
    node.val = val
  end

  def remove(key)
    node = first
    until node.key == key || node == @tail
      node = node.next
    end
    
     prev_node = node.prev
     next_node = node.next
     # node.prev = 
     prev_node.next = next_node
     next_node.prev= prev_node
  end

  def each
    n = first
    result = []
    # debugger
    until n == @tail
      yield n
      n = n.next
    end  
    # result
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
