export default class Bird {
  constructor(dimensions){
    this.canvasHeight = dimensions.height; 
    this.canvasWidth = dimensions.width; 
    this.velocity = 0;
    this.x = dimensions.width/3;
    this.y = dimensions.height/2;
  }

  drawBird(ctx){
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.x, this.y, 40,30);
  }

  animate(ctx){
    this.move();
    this.drawBird(ctx);
  }

  move(){
    this.y += this.velocity;
    this.velocity += 0.5;
  }

  flap(){
    this.velocity = -8;
  }
}

