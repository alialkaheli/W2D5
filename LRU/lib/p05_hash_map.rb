require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    k = key.hash % num_buckets
    @store[k].include?(key)
  end

  def set(key, val)
    if @count >= num_buckets
       resize!
     end 
    k = key.hash % num_buckets
    if include?(key)
      @store[k].update(key,val)
    
    else 
      @store[k].append(key,val)
      @count += 1
    end 
    
  end

  def get(key)
    k = key.hash % num_buckets
    # get(@store[k])
    @store[k].get(key)
    # LinkedList.get(@store[k])
  end

  def delete(key)
    k = key.hash % num_buckets
    @store[k].remove(key)
    @count -= 1
  end

  def each
    
    @store.each do |list|
      # n = list.first
      # until n == @tail
      #   yield n
      #   n = n.next
      # end  
      list.each do |node|
        yield node.key, node.val
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    arr_link = @store
    num = 2 * num_buckets
    @store = Array.new(num) { LinkedList.new }
    arr_link.each do |list|
      list.each do |node|
        a = node.key.hash % num
        @store[a].append(node.key, node.val) 
      end 
    end 
    @store  
    
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
