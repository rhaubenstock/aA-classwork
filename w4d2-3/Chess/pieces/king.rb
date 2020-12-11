require_relative "../game/piece.rb"
require_relative "../modules/steppable.rb"

class King < Piece
  include Steppable

  def symbol
    :♔
  end

  def move_diffs
    [[0,1],[0,-1],[1,0],[-1,0],[1,1],[-1,-1],[1,-1],[-1,1]]
  end
end