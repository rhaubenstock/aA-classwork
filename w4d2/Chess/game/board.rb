pieces = ["bishop", "king", "knight", "null_piece", "pawn", "queen", "rook"]
pieces.each {|piece| require_relative "../pieces/#{piece}.rb"}


# require "colorize"

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
        build_board
        
        # (0..7).each do |col_idx|
        #     [0,1,6,7].each do |row_idx|
        #         @rows[row_idx][col_idx] = Piece.new
        #     end
        # end
    end

    def [](position)
        @rows[position[0]][position[1]]
    end

    def []=(position, value)
        @rows[position[0]][position[1]] = value
    end

    def move_piece(starting_pos, end_pos)
        raise "No Piece at starting position" if self[starting_pos].empty?
        raise "Invalid move" unless end_pos.all? { |idx| idx.between?(0,7)} && self[starting_pos].valid_moves.include?(end_pos)
        self[starting_pos].pos = end_pos
        self[end_pos] = self[starting_pos]
        self[starting_pos] = NullPiece.instance
    end

    def render
        @rows.each do |row|
            puts row.map(&:to_s).join(' ')
        end
        nil
    end

    protected
    def build_board
        piece_color = :black
        BLACK_PIECES.each do |piece_class, piece_pos|
            self[piece_pos] = piece_class.new(piece_color, self, piece_pos)
        end

        piece_color = :white
        WHITE_PIECES.each do |piece_class, piece_pos|
            self[piece_pos] = piece_class.new(piece_color, self, piece_pos)
        end
    end

    private
    BLACK_PIECES = [[Pawn, [1,0]], [Pawn, [1,1]], [Pawn, [1,2]]]
    WHITE_PIECES = []

end
