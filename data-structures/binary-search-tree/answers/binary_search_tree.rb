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

  def depth(node=@root)
    return 0 if node.nil? || node.has_no_children?
    left_depth = depth(node.left)
    right_depth = depth(node.right)
    [left_depth, right_depth].max + 1
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
    post_order(node.right, &prc)
    prc.call(node)
  end

  private

  def to_vine(node=@root)
    tail = node
    rest = tail.right
    until rest.nil?
      if rest.left.nil?
        tail = rest
        rest = rest.right
      else
        temp = rest.left
        rest.left = temp.right
        temp.right = rest
        rest = temp
        tail.right = temp
      end
    end
  end

  def to_tree(node=@root)
    leaves = count + 1 - 2 ** Math.log(count + 1, 2)
  end

  def compress(node, count)
    count.times do

    end
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

pre_ordering = [5, 1, 9, 7, 11, 10, 12]
pre_order_result = []
tree.pre_order do |el|
  pre_order_result << el.key
end
puts "pre-order test pass: #{pre_ordering == pre_order_result}"

in_ordering = [1, 5, 7, 9, 10, 11, 12]
in_order_result = []
tree.in_order do |el|
  in_order_result << el.key
end
puts "in-order test pass: #{in_ordering == in_order_result}"

post_ordering = [1, 7, 10, 12, 11, 9, 5]
post_order_result = []
tree.post_order do |el|
  post_order_result << el.key
end
puts "post-order test pass: #{post_ordering == post_order_result}"

bfs_ordering = [5, 1, 9, 7, 11, 10, 12]
bfs_order_result = []
tree.breadth_first_traversal do |el|
  bfs_order_result << el.key
end
puts "breadth_first_traversal test pass: #{bfs_order_result == bfs_order_result}"

puts "depth test pass: #{tree.depth == 3}"

vine = in_ordering
tree.send(:to_vine)
puts "vine test pass: #{tree.depth == (tree.count - 2)}"

tree.send(:to_tree)
