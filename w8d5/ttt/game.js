var Board = require("./board");
class Game {
    constructor() {
        this.board = new Board(); 
    }

    winner() {
        return this.board.winner();
    }

    run(reader, completionCallback){
        while(!this.winner()){
            // display board
            this.board.print();

            // prompt player for position
            reader.question(string, cb )
            
            // if valid position -> placemark
        }
        completionCallback();
    }
}