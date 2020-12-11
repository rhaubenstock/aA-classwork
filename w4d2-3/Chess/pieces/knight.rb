require_relative "../game/piece.rb"
require_relative "../modules/steppable.rb"

class Knight < Piece
  include Steppable

  def symbol
    :♘
  end

  def move_diffs
    [[2,1],[1,2],[2,-1],[1,-2],[-2,-1],[-1,-2],[-2,1],[-1,2]]
  end
end