const CONSTANTS = {
  DISTANCE: 220,
  GAP: 150
};

export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;
    //this.pipes = [];
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  animate(ctx){
    this.drawBackground(ctx);
  }
}