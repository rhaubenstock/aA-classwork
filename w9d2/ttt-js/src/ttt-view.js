class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    // console.log('test');
    this.bindEvents();
  }

  bindEvents() {
    const $listEls = $(".grid-cell");
    //add listener to each li
    // -> call this.game.playMove(pos) on each
    // -> listener needs to know pos that it corresponds to
    
    // 0 -> [0,0]
    // 1 -> [0,1]
    // ...
    // 8 -> [2,2]
    // for(let i = 0; i < 9; i++) {
    //   $listEls.on("click", (e)=> {
    //     let rowIndex = Math.floor(i / 3);
    //     let colIndex = i % 3
    //     this.game.playMove([rowIndex, colIndex]);
    //     // console.log(this.game.board[rowIndex][colIndex]);
    //     $listEls.addClass('clicked');
        
    //   })
    // }
    const $bucketList = $('.grid');
    $bucketList.on('click', 'li', (e) => { 
      $(e.target).toggleClass('complete') 
      let rowIndex = Math.floor(e.id / 3);
      let colIndex = e.id % 3;
      this.game.playMove([rowIndex, colIndex]);
    })
  }

  makeMove($square) {}

  setupBoard() {
    const $grid = $("<ul class='grid'></ul>");
    // 9 li's
    for (let i = 0; i < 9; i++){
      $grid.append(`<li class='grid-cell' id='${i}'></li>`);
    }
    this.$el.append($grid);
  }
}

module.exports = View;
