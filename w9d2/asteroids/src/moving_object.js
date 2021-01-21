function MovingObject(){
  this.pos = arguments[0].pos;
  this.vel = arguments[0].vel;
  this.radius = arguments[0].radius;
  this.color = arguments[0].color;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];  
}

module.exports = MovingObject;