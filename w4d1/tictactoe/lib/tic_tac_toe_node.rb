require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_arr = []
    (0..2).each do |row_idx|
      (0..2).each do |col_idx|
        if @board.empty?([row_idx, col_idx])
          new_board = @board.dup
          pos = [row_idx, col_idx]
          new_board[pos] = @next_mover_mark
          next_mark = @next_mover_mark == :x ? :o : :x
          new_node = self.class.new(new_board, next_mark, pos)
          child_arr << new_node
        end
      end
    end
    child_arr
  end
end
