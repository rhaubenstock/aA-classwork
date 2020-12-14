class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    bucket = self[key.hash]
    unless bucket.include?(key)
      bucket << key
      @count += 1
    end
    resize! if num_buckets == count
  end

  def include?(key)
    bucket = self[key.hash]
    bucket.include?(key)
  end

  def remove(key)
    bucket = self[key.hash]
    if bucket.include?(key)
      bucket.delete(key)
      @count -= 1
    end
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
      bucket.each do |key|
        new_bucket_idx = key.hash % new_store.length
        new_store[new_bucket_idx] << key
      end
    end
    @store = new_store
  end
end
