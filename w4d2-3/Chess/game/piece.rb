class Piece
    # symbol, Board, Array
    attr_reader :color, :pos, :board
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol.to_s #♙
    end

    def empty?
        @color == nil
    end

    # reject moves that have a same color piece in them
    def valid_moves
        moves
    end

    # changes pos from current_pos to where the piece moved
    def pos=(val)
        #do we modify board here? or just piece?
        @pos = val
    end

    def symbol
        raise "Called from piece class! Should be overwritten!"
    end
    
    private
    def move_into_check?(end_pos)
    end
end