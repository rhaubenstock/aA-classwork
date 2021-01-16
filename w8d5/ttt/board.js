class Board {
    constructor(){
        this.grid = [Array(3),Array(3),Array(3)];
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
        const rowWinner = this.grid.some(function(row){
                    return row[0] !== undefined && row.every(function(ele){
                        return ele === row[0];
                    })
                })
        
    }
}