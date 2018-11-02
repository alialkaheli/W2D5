require_relative "p02_hashing.rb"
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    a = key.hash % num_buckets
    if @count >= num_buckets
       resize!
     end 
    a = key.hash % num_buckets 
    if !include?(key) 
      @store[a] << key 
      @count += 1
    end 
  end

  def include?(num)
    a = num.hash % num_buckets
    return true if @store[a].include?(num)
    false
  end

  def remove(num)
    a = num.hash % num_buckets
    
    if include?(num) 
      @store[a].delete(num)
      @count -= 1
    end 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_array = @store
    num = 2 * num_buckets
    @store = Array.new(num) { Array.new }
    old_array.each do |arr|
      arr.each do |el|
        a = el.hash % num
        @store[a] << el 
      end 
    end 
    @store  
  end
  end

