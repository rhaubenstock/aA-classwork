const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;
window.addEventListener('DOMContentLoaded', function() {
  const canvasEl = document.getElementsByTagName("canvas")[0];
  const ctx = canvasEl.getContext('2d');
  const movingObj = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"});
  movingObj.draw(ctx);
}.bind(window))