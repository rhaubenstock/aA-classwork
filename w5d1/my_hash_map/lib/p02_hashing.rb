class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.to_s
        .hash #calls String#hash
  end
end
 
class String
  def hash
    self.chars
        .map
        .map(&:ord)
        .map(&:to_s)
        .join
        .to_i
        .hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
