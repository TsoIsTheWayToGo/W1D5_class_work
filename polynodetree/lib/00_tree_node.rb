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



end


