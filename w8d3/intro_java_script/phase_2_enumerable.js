Array.prototype.myEach = function(cb){

  for(ele of this){
    cb(ele);
  }
}

Array.prototype.myMap = function (cb) {

  let map = []; 
  for (ele of this) {
    map.push(cb(ele));
  }
  return map;
}


Array.prototype.myReduce = function (cb, initialValue) {
  let start = 0;

  if(initialValue===undefined){
    initialValue = this[0] 
    start = 1;
  }
  acc = initialValue;

  for (ele of this.slice(start)) {
    acc = cb(acc, ele);
  }
  return acc;
}

