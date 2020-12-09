class Piece
    # symbol, Board, Array
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        @color.to_s #♙
    end

    def empty?
        #should return true if null piece? -> override to true in null piece class
        false
    end

    def valid_moves
        # return array of possible moves
    end

    def pos=(val)
    end

    def inspect
        return "p"
    end
end