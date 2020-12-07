require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

  end

  def losing_node?(evaluator)
    #evaluator is a mark (looking at spec file line 69)
    #losing state if opposite mark has a full row, col or diag
    
    # if winner returns opposite of evaluator -> then losing node
    if @board.over?
      return false if @board.winner == nil
      return @board.winner != evaluator
    end
    if @next_mover_mark == evaluator 
      # if it is this players turn
      #  should return true if every child is a loser (for self's mark)
      children.all? {|child_node| child_node.losing_node?(evaluator)}
    else
      # if it is opponents turn
      #  should return true if any child is a loser (for self's mark)
      children.any? {|child_node| child_node.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return false if @board.winner == nil
      return @board.winner == evaluator
    end
    if @next_mover_mark == evaluator
      children.any? {|child_node| child_node.winning_node?(evaluator)}
    else
      children.all? {|child_node| child_node.winning_node?(evaluator)}
    end
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
