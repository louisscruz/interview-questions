# Binary Search Tree

A binary search tree is data structure where the each node has two children, where the value of the leftmost child is less than the parent and the value of the rightmost child is greater than the parent.

Construct a binary search tree with the following API:

* insert(key)
  * This should allow for batch insertion as well and balance the tree after insertion.
* delete(key)
  * This should allow for batch deletion as well and balance the tree after deletion.
* search(key)
  * This should return a node with the specified key if one exists, or it should return nil.
* min(node)
  * If a node is provided, find the min within that sub-tree.
* max(node)
  * If a node is provided, find the max within that sub-tree.
* depth(node)
  * If a node is provided, find the heigh of that sub-tree.
* breadth_first_traversal(node)
  * If a node is provided, perform breadth_first_traversal on that sub-tree.
* pre_order(node)
  * If a node is provided, perform pre_order on that sub-tree.
* in_order(node)
  * If a node is provided, perform in_order on that sub-tree.
* post_order(node)
  * If a node is provided, perform post_order on that sub-tree.
