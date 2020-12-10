require "colorize"
require_relative "cursor.rb"
require_relative "../game/board.rb"
class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end


    def render
        #while true ; sleep ; 
        prev_cursor_pos = nil
        selected_pos = nil 
        print_board(selected_pos)
        loop do
            input = @cursor.get_input
            if input != nil 
                selected_pos = @cursor.selected ? input.dup : nil
                print_board(selected_pos)
            end
            if prev_cursor_pos != @cursor.cursor_pos
                print_board(selected_pos)
                prev_cursor_pos = @cursor.cursor_pos
            end   
        end
    end

    def print_board(selected_pos)
        system("clear")
        @board.rows.each_with_index do |row, row_idx|
            # colorize based on piece color and cursor
            
            row.each_with_index do |piece, col_idx|
                
                background_color = (row_idx + col_idx).even? ? :light_blue : :green
                background_color = :yellow if [row_idx, col_idx] == @cursor.cursor_pos 
                background_color = :red if [row_idx, col_idx] == selected_pos
                print (piece.to_s + ' ').colorize(:color => piece.color, :background => background_color)
            end
            puts 
            #puts "this should be red".colorize(red) + " "
        end
    end
end

b = Board.new
d = Display.new(b)
d.render