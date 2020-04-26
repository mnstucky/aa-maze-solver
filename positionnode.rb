class PositionNode

    attr_reader :position, :parent
    attr_accessor :children
    
    def initialize(position, maze_value, g_score, h_score)
        @position = position
        @maze_value = maze_value
        @g_score = g_score
        @h_score = h_score
        @parent = nil
        @children = []
    end

    def parent=(node)
        unless @parent ==  nil
            @parent.children.delete(self)
        end
        @parent = node
        unless @parent == nil || @parent.children.include?(self)
            @parent.children << self
        end
    end

    def bfs(position)
        queue = []
        queue << self
        until queue == []
            test_node = queue.shift
            return test_node if test_node.position == position
            test_node.children.each { |child| queue << child }
        end
        nil
    end

end