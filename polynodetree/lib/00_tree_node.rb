require_relative "queue"

class PolyTreeNode

def initialize(value)
    @value = value
    @children = []
    @parent = nil
end

def parent
    @parent
end

def children
    @children
end

def value
   @value
end

def parent=(node)
    return if self.parent == node
    if self.parent.nil?
        @parent = node
        node.children << self
    else
        self.parent.children.delete(self)
        @parent = nil
        self.parent=(node)
    end
    return node
end

def add_child(child_node)
    child_node.parent = self
end

def remove_child(child_node)
    raise "Not a child." unless child_node.parent == self
    child_node.parent = nil 
end

def dfs(target_value)
    return self if self.value == target_value
    
    children.each do |child|
        child_search = child.dfs(target_value)
        return child_search unless child_search.nil?
    end
    nil
end

def bfs(target_value)
    q = MyQueue.new
    q.enqueue(self)

    until q.empty?
        curr_node = q.dequeue
        return curr_node if curr_node.value == target_value
        curr_node.children.each do |child|
            q.enqueue(child)
        end
    end
    nil
end

end


