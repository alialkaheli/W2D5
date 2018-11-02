class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
  
    self.each_with_index.inject(0) do |inj,(el, idx)| 
       (el.hash + idx.hash) ^ inj
    end
    
  end
end

class String
  def hash
    arr = self.split("")
    arr.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end
