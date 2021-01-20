const View = require("./ttt-view") // require appropriate file
const Game = require("../../ttt-node-solution/game")// require appropriate file

  $(() => {
    // Your code here
    const game = new Game;
    const figEle = $(".ttt");
    const view = new View(game, figEle);

  });
