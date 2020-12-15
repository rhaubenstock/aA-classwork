require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require "byebug"
class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      node = @map.get(key) 
      update_node!(node)
    else
      calc!(key)
    end
    @map.get(key).val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # debugger
    # suggested helper method; insert an (un-cached) key
    @store.append(key, @prc.call(key))
    # add to hashmap 
    @map.set(key, @store.last)
    # we could hit over max size
    eject! if count > @max
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    # first remove node from list
    # then append node to list
    @store.remove(node.key)
    # we still have access to node 
    @store.append(node.key, node.val)
    @map.set(node.key, @store.last)
  end

  def eject!
    # removing oldest node
    key_to_remove = @store.first.key
    @map.delete(key_to_remove)
    @store.remove(key_to_remove)
  end
end
