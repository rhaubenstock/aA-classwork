module Steppable
    def moves
        pos_moves = []
        move_diffs.each do |move|
            new_pos = [ moves[0] + pos[0], moves[1] + pos[1] ]
            if new_pos.all {|idx| idx.between?(0,7)}
                && (board[new_pos].empty? || board[new_pos].color != color)
                        pos_moves << new_pos
            end
        end
    end

    private
    def move_diffs 
        raise "This should be overwritten by a piece! Calling from Steppable Module"
    end
end