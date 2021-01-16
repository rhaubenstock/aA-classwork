class Board {
    constructor(){
        this.grid = [Array(3),Array(3),Array(3)];
        this.player = "x"
    }
    empty(pos) {
        return this.grid[pos[0]][pos[1]] === undefined;
    }

    place_mark(pos,mark){
        if (this.empty(pos)){
            this.grid[pos[0]][pos[1]] = mark;
        }
    }

    won(){
        const rowWinner = [0,1,2].some(function(row_idx){
            return this.grid[row_idx][0] !== undefined && [0,1,2].every(function(col_idx){
                return this.grid[row_idx][0] === this.grid[row_idx][col_idx];
            });
        });
        

        const colWinner = [0,1,2].some(function(col_idx){
            return this.grid[0][col_idx] !== undefined && [0,1,2].every(function(row_idx){
                return this.grid[0][col_idx] === this.grid[row_idx][col_idx];
            });
        });

        const topLeftDiagWinner = this.grid[0][0] != undefined && [0,1,2].every(function(idx){
            return this.grid[idx][idx] === this.grid[0][0];
        });
        //0,2 ; 1,1; 2,0
        const topRightDiagWinner = this.grid[0][2] != undefined && [0,1,2].every(function(idx){
            return this.grid[idx][2-idx] === this.grid[0][2];
        });
        return rowWinner || colWinner || topLeftDiagWinner || topRightDiagWinner;
    }

    winner(){
        if (this.won()){
            return this.player;
            
        }
    }

    print(){
        console.log(this.grid[0].join(" "));
        console.log(this.grid[1].join(" "));
        console.log(this.grid[2].join(" "));
    }
}

module.exports = Board;

