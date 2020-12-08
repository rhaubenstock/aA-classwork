module Slidable
  HORIZONTAL_DIRS = [[0,-1],[0,1],[1,0],[-1,0]] #horizontal and vertical
  DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    directions = self.move_dirs
    all_moves = []
    directions.each do |direction|
      all_moves += grow_unblocked_moves_in_dir(direction[1], direction[0])
    end
    all_moves
  end

  private
  def move_dirs
    # could be any combination of horizontal, vertical, and diagonal
    raise "This should be overwritten by a piece! Calling from Slidable Module"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    unblocked_moves = []
    current_position = [pos[0]+dy,pos[1]+dx]
    # until the last move that we check has a piece there or move off board
    # take previous move add manipulation
    # add 

    # TODO: what if current_position is occuppied by piece with opposite color?
    while current_position.all {|idx| idx.between?(0,7)} && board[current_position].empty?
      unblocked_moves << current_position
      current_position[0] += dy
      current_position[1] += dx
    end
    unblocked_moves
  end
end