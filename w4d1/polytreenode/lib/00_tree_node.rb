class PolyTreeNode

  attr_reader :children, :parent, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    #parent: parent_node
    #child: self

    if parent_node == nil
      @parent = nil
      return nil
    end
    @parent.children.delete(self) if @parent != nil
    parent_node.children << self if !parent_node.children.include?(self)
    @parent = parent_node
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'node is not a child' if child_node.parent != self
    child_node.parent = nil
  end

  def dfs(value)
    return self if self.value == value
    self.children.each do |node|
        result = node.dfs(value)
        return result if result != nil
    end
    nil
  end

  def bfs(value)
    #queue 
    arr_queue = [self]
    while !arr_queue.empty?
      node = arr_queue.shift
      return node if node.value == value
      node.children.each do |child_node|
        arr_queue << child_node
      end
    end
    nil
  end
  

end