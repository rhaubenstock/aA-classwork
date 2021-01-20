class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
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
    $listEl.on("click", ()=>{})
  }

  makeMove($square) {}

  setupBoard() {
    const $grid = $("<ul></ul>");
    // 9 li's
    for (let i = 0; i < 9; i++){
      $grid.append("<li class='grid-cell'></li>");
    }
    this.$el.append($grid);
  }
}

module.exports = View;
