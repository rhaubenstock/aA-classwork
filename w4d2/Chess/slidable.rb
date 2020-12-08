module Slidable
  HORIZONTAL_DIRS = [[0,-1],[0,1]]
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
      all_moves += grow_unblocked_moves_in_dir(direction[0], direction[1])
    end
    all_moves
  end

  private
  def move_dirs
    # could be any combination of horizontal, vertical, and diagonal
    nil
  end

  def grow_unblocked_moves_in_dir(dx, dy)

  end

  

end