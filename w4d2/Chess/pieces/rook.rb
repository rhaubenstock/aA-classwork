require_relative "../game/piece.rb"
require_relative "../modules/slidable.rb"

class Rook < Piece
  include Slidable

  def symbol
    :♖
  end

  def move_dirs
    horizontal_dirs
  end

end