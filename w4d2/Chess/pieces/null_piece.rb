require_relative "../game/piece"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
    @board = nil
    @pos = nil
  end

  def moves
    nil
  end

  def symbol
    " "
  end
end