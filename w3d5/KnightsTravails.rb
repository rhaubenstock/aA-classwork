require_relative "./skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        moves = [[2,1], [2,-1], [-2, 1], [-2,-1], [1,2], [1,-2], [-1, 2], [-1,-2]]
        kept_moves = []
        moves.each do |move|
            new_position = [pos[0]+move[0],pos[1]+move[1]]
            kept_moves << new_position if new_position.all? {|el| el <= 7 && el >= 0}
        end
        kept_moves
    end

    def new_move_positions(pos)
        # new_positions = KnightPathFinder.valid_moves(pos).reject{|el| @considered_positions.include?(el)}
        new_positions = []
        KnightPathFinder.valid_moves(pos).each do |el|
            # if el is in @considered_positions -> do not shovel in 
            new_positions << el if !@considered_positions.include?(el)
        end

        @considered_positions += new_positions
        new_positions
    end

    def build_move_tree
        # create new PolyTreeNodes for each new position
        # @root <- children to root if reachable within one move

        node_queue = [@root_node]
        until node_queue.empty?
            node = node_queue.shift
            # get new moves
            new_moves = new_move_positions(node.value)
            # create PolyTreeNode for each new move
            new_moves.each do |move|
                new_node = PolyTreeNode.new(move)
                node_queue << new_node
                new_node.parent = node
            end
            # make sure order is correct
        end
    end
end