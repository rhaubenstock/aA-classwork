pieces = ["bishop", "king", "knight", "null_piece", "pawn", "queen", "rook"]
pieces.each {|piece| require_relative "../pieces/#{piece}.rb"}


# require "colorize"

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
        build_board
        
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

    def in_check?(color)
        # find king of same color's position 
            # iterate over grid until king object found with color 
        # any pieces of the opposite color have kings position as a valid move
            # loop through all pieces of opposite color and check if any valid_moves
            # include the kings position
        king = find_king(color)
        other_pieces = get_other_pieces(color)
        other_pieces.any? { |piece| piece.valid_moves.include?(king.pos)}
    end

    def checkmate?(color)
        king = find_king(color)
        if in_check?(color)
            # need to check all valid moves of color pieces
            # check to see if any valid_move will bring the king out of check
        end
    end

    def find_king(color)
        king = nil
        @rows.each do |row|
            king = row.select { |piece| piece.is_a?(King) and piece.color == color }.first
            break unless king.nil?
        end
        king
    end

    def get_other_pieces(color)
        other_pieces = []
        @rows.each do |row|
            other_pieces += row.reject { |piece| piece.color == color || piece.empty? }
        end
        other_pieces
    end

    # for testing purposes only
    def render
        @rows.each { |row| puts row.map(&:to_s).join(' ') }
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
    BLACK_PIECES = (0..7).map { |col| [Pawn, [1, col] ] } + 
                    [0, 7].map { |col| [Rook, [0, col] ] } + 
                    [1, 6].map { |col| [Knight, [0, col] ] } + 
                    [2, 5].map { |col| [Bishop, [0, col] ] } + 
                    [ [Queen,[0, 3] ], [King,[0, 4] ] ]
    WHITE_PIECES = (0..7).map { |col| [Pawn, [6, col] ] } +
                    [0, 7].map { |col| [Rook, [7, col] ] } +
                    [1, 6].map { |col| [Knight, [7, col] ] } +
                    [2, 5].map { |col| [Bishop, [7, col] ] } +
                    [ [Queen, [7, 3] ], [King, [7, 4] ] ]

end
