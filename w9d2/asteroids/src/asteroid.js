const Util = require("./util");
const MovingObject = require("./moving_object");



function Asteroid(options){
  options.color ||= "green";
  options.radius ||= 50;
  options.vel ||= Util.randomVec();
  debugger;
  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;