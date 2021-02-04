Array.prototype.bubbleSort = function(){
  let bubble = function(a,b) {
    return Math.sign(a - b);
  }
  let sorted = false;
  while(!sorted) {
    sorted = true;
    for(let i = 0; i < this.length - 1; i++){
      if (bubble(this[i], this[i+1]) === 1){
        [this[i], this[i+1]] = [this[i+1], this[i]];
        sorted = false;
      }
    }
  }
  return this;
}

String.prototype.substrings = function(){
  let substrings = [];
  for(let start = 0; start < this.length; start++){
    for(let finish = start + 1; finish <= this.length; finish++){
      substrings.push(this.slice(start, finish));
    }
  }
  return substrings;
}
