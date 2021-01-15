// each node has its own instance of board
// whose move it is

// children -> each possible move -> 
// switches color, new board state with piece placed

if (typeof window === 'undefined'){
  var readline = require("readline");
  var Piece = require("./piece.js");
  var Board = require("./board.js");
}

function Node(board, color){
  this.board = board;
  this.color = color;
  this.children = [];
}

Node.prototype.populate = function(){
  //children will all be nodes, with next board state
  this.board.validMoves(this.color).forEach(
    move => {
      // create a new copy of board
      // place the piece on the new copy of board
      // create the next node
      
      // to create a new copy of board
      // create a 2d grid
      // populate it with pieces that are copies (not references)
      // at the same locations with the same colors

      // iterating over board.grid -> if there is a piece -> create a new piece with same color
      let gridCopy = [];
      this.board.grid.forEach(
        row => {
          let rowCopy = row.map(
            piece => piece ? new Piece(piece.color) : undefined
          )
          gridCopy.push(rowCopy);
        }
      );
      
      let newBoard = new Board();
      newBoard.grid = gridCopy;
      newBoard.placePiece(move, this.color);
      this.children.push(new Node(newBoard, this.color === 'black' ? 'white' : 'black'));
    }
  )
}

