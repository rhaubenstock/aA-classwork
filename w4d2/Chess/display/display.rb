require "colorize"
require_relative "cursor.rb"

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end


    def render
        @board.rows.each do |row|
            puts row.map(&:to_s).join(' ')
        end
        nil
    end
end