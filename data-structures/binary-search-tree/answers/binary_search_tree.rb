class BinarySearchTree
  class Node
    attr_accessor :key, :left, :right

    def initialize(key, parent=nil)
      @key = key
      @parent = parent
      @left = nil
      @right = nil
    end

    def insert(new_key)
      case new_key <=> @key
      when -1
        if @left.nil?
          @left = Node.new(new_key, self)
        else
          @left.insert(new_key)
        end
      when 1
        if @right.nil?
          @right = Node.new(new_key, self)
        else
          @right.insert(new_key)
        end
      end
    end

    def has_children?
      @left || @right
    end

    def has_no_children?
      @left.nil? && @right.nil?
    end

    def delete_from_parent
      return unless @parent
      if @key < @parent.key
        @parent.left = nil
      else
        @parent.right = nil
      end
    end

    def splice_left
      @parent.left = @left
    end

    def splice_right
      @parent.right = @right
    end

    def splice_min(min_node)
      @key = min_node.key
      min_node.delete_from_parent
    end
  end

  attr_reader :length, :count

  def initialize(root=nil)
    @root = root
    @count = @root.nil? ? 0 : 1
  end

  def insert(key)
    @root.nil? ? @root = Node.new(key) : @root.insert(key)
    @count += 1
  end

  def delete(key, node=@root)
    node = search(key)
    return unless node
    if node.has_no_children?
      node.delete_from_parent
    elsif node.left && node.right
      node.splice_min(min(node.right))
    else
      node.left ? node.splice_left : node.splice_right
    end
    @count -= 1
  end

  def search(key, node=@root)
    return nil if node.nil?
    return node if node.key == key
    if key < node.key
      search(key, node.left)
    else
      search(key, node.right)
    end
  end

  def min(node=@root)
    while node.left
      node = node.left
    end
    node
  end

  def max(node=@root)
    while node.right
      node = node.right
    end
    node
  end

  def breadth_first_traversal(node=@root, &prc)
    nodes = [node]
    until nodes.empty?
      node = nodes.shift
      prc.call(node)
      nodes.push(node.left) if node.left
      nodes.push(node.right) if node.right
    end
  end

  def pre_order(node=@root, &prc)
    return if node.nil?
    prc.call(node)
    pre_order(node.left, &prc)
    pre_order(node.right, &prc)
  end

  def in_order(node=@root, &prc)
    return if node.nil?
    in_order(node.left, &prc)
    prc.call(node)
    in_order(node.right, &prc)
  end

  def post_order(node=@root, &prc)
    return if node.nil?
    post_order(node.left, &prc)
    prc.call(node)
    post_order(node.right, &prc)
  end
end

tree = BinarySearchTree.new
tree.insert(5)
tree.insert(3)
tree.insert(1)
tree.insert(9)
tree.insert(7)
tree.insert(11)
tree.insert(10)
tree.insert(12)

tree.delete(3)

p 'pre order'
tree.pre_order do |el|
  p el.key
end

p 'in order'
tree.in_order do |el|
  p el.key
end

p 'post order'
tree.post_order do |el|
  p el.key
end

tree.delete(11)

p 'deleted 11'
tree.in_order do |el|
  p el.key
end

tree.breadth_first_traversal do |el|
  p el.key
end
