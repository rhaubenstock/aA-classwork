require_relative "piece.rb"

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        (0..7).each do |col_idx|
            [0,1,6,7].each do |row_idx|
                @rows[row_idx][col_idx] = Piece.new
            end
        end
    end

    def [](position)
        @rows[position[0]][position[1]]
    end

    def []=(position, value)
        @rows[position[0]][position[1]] = value
    end

    def move_piece(starting_pos, end_pos)
        raise "No Piece at starting position" if self[starting_pos].nil?
        raise "Invalid end position" unless end_pos.all? { |idx| idx.between?(0,7)} && self[end_pos].nil?
        self[end_pos] = self[starting_pos]
        self[starting_pos] = nil
    end

end
