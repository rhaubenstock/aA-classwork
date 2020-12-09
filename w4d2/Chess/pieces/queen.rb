require_relative "../game/piece.rb"
require_relative "../modules/slidable.rb"

class Queen < Piece
  include Slidable

  def symbol
    "♕"
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end