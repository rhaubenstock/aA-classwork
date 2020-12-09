load "game/board.rb"; load "pieces/pawn.rb"; b = Board.new; pawn = Pawn.new(:white, b, [6,0]); pawn.valid_moves 

load "game/board.rb" ; load "pieces/bishop.rb" ; load "pieces/king.rb" ; load "pieces/knight.rb" ; load "pieces/pawn.rb" ; load "pieces/queen.rb" ; load "pieces/rook.rb" ; b = Board.new

pawn = Pawn.new(:white, b, [6,1] ) ; bishop = Bishop.new(:white, b, [7, 3]) ; king = King.new(:black, b, [0,4]) ; queen = Queen.new(:black, b, [7,5]) ; rook = Rook.new(:black, b, [0,0]) ; knight = Knight.new(:black, b, [0,6] ) ; king_white = King.new(:white, b, [7,4]) ; black_bishop = Bishop.new(:black, b, [0,2])

b[pawn.pos] = pawn ; b[bishop.pos] = bishop ; b[king.pos] = king ; b[queen.pos] = queen ; b[rook.pos] = rook; b[knight.pos] = knight ; b[king_white.pos] = king_white ; b[black_bishop.pos] = black_bishop ; b.render