class LRUCache
  def initialize(size)
    @underlying_array = []
    @size = size
  end

  def count
    # returns number of elements currently in cache
    @underlying_array.length
  end

  def add(el)
    # adds element to cache according to LRU principle

    # if element is already in cache
    #     delete at index of element and shovel element at end of cache
    # if the element is not already in the cache
    #     if cache is full
    #         shift off front element, then shovel element to end of cache
    #     if cache is not full
    #         shovel element to end of cache

    if @underlying_array.include?(el)
      @underlying_array.delete(el)
    else
      @underlying_array.shift if count == @size
    end
    @underlying_array << el
    nil
  end

  def show
    # shows the items in the cache, with the LRU item first
    print @underlying_array
  end

  private
  # helper methods go here!

end


if __FILE__ == $PROGRAM_NAME
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end