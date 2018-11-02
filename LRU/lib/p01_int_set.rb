class MaxIntSet
  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    is_valid?(num)
      @store[num-1] = true
      
  end

  def remove(num)
    @store[num-1] = false
  end

  def include?(num)
    validate!(num)
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if (0 > num || @store.count < num)
  end

  def validate!(num)
    return true if @store[num-1]
    false
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    a = num % num_buckets
    @store[a] << num 
    @store
  end

  def remove(num)
    a = num % num_buckets
    @store[a].delete(num)
  end

  def include?(num)
    a = num % num_buckets
    return true if @store[a].include?(num)
    false
    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    
    a = num % num_buckets
    if @count > 
  end

  def remove(num)
  end

  def include?(num)
    a = num % num_buckets
    return true if @store[a].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
  end
end
