class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false) 
  end

  def insert(num)
    raise "Out of bounds" if is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" if is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num > @max || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = self[num]
    # add to bucket if its not already there
    bucket << num if !bucket.include?(num)  #Array include
  end

  def remove(num)
    bucket = self[num]
    bucket.delete(num) if bucket.include?(num)
  end

  def include?(num) # IntSet#include
    bucket = self[num]
    bucket.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
    bucket = self[num]
    unless bucket.include?(num)
      bucket << num
      @count += 1
    end
    resize! if count == num_buckets
  end

  def remove(num)
    bucket = self[num]
    if bucket.include?(num)
      bucket.delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |el|
        new_store[el % new_store.length] << el
      end
    end
    @store = new_store
  end
end
