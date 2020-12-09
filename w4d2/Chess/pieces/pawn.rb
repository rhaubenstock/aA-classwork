require_relative "../game/piece.rb"

class Pawn < Piece 

    def symbol 
        "♙"
    end

    def moves

    end

    private
    def at_start_row?
        (color == :black && pos[0] == 1) || (color == :white && pos[0] == 6)
    end

    def forward_dir
        color == :black ? 1 : -1 
    end

    def forward_steps
        steps = [[pos[0]+forward_dir, pos[1]]]
        if at_start_row?
            steps << [pos[0] + (2*forward_dir), pos[1]]
        end
        steps
    end

    def side_attacks
        attacks = []
        [-1, 1].each do |col_diff|
            enemy_position = [pos[0]+forward_dir, pos[1] + col_diff]
            if  enemy_position[1].between?(0,7) && board[enemy_position].color != color 
                attacks << enemy_position
            end
        end
        attacks
    end

end