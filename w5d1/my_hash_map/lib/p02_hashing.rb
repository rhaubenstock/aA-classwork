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
    # cannot do map
    # convert hash to array
    self.to_a
        .sort #{|pair_1, pair_2| pair_1[0] <=> pair_2[0]}
        .hash
  end
end
