class Piece
    # symbol, Board, Array
    attr_reader :color
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        @color.to_s #♙
    end

    def empty?
        @color != nil
    end

    def valid_moves
        moves
    end

    def pos=(val)
        #do we modify board here? or just piece?

    end

    def symbol
        raise "Called from piece class! Should be overwritten!"
    end
    
    private
    def move_into_check?(end_pos)
    end
end