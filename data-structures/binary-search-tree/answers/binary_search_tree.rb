class BinarySearchTree
  class Node
    attr_accessor :value, :left, :right

    def initialize(value)
      @value = value
      @parent = nil
      @left = nil
      @right = nil
    end

    def insert(new_value)
      case new_value <=> @value
      when -1
        if @left.nil?
          @left = Node.new(new_value)
        else
          @left.insert(new_value)
        end
      when 1
        if @right.nil?
          @right = Node.new(new_value)
        else
          @right.insert(new_value)
        end
        # @right.nil? ? @right = Node.new(new_value): @right.insert(new_value)
      end
    end

    def has_no_children?
      @left.nil? && @right.nil?
    end

    def has_children?
      !@left.nil? || !@right.nil?
    end
  end

  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    @root.nil? ? @root = Node.new(value) : @root.insert(value)
  end

  def delete(value)
    node = search(value)
    p node
    return unless node
    if node.has_no_children?
      p 'no children'
    elsif node.left || node.right
      p 'one'
    else
      p 'all'
    end
  end

  def search(value, node=@root)
    return nil if node.nil?
    return node if node.value == value
    value < node.value ? search(value, node.left) : search(value, node.right)
  end

  def min
  end

  def max
  end

  def count
  end
end

tree = BinarySearchTree.new
tree.insert(5)
tree.insert(1)
tree.insert(10)
tree.insert(0)
tree.insert(3)
tree.insert(7)
tree.insert(11)

puts tree.search(5).value == 5
puts tree.search(4) == nil
puts tree.search(1).value == 1

tree.delete(1)
