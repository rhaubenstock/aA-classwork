Array.prototype.uniq = function(){

  let uniq_array = [];
  let uniq_hash = {};
  for( let i = 0; i < this.length; i++){
    if (!uniq_hash[this[i]]) {
      uniq_hash[this[i]]=true;
      uniq_array.push(this[i]);
    }
  }
  return uniq_array;
}

Array.prototype.twoSum = function(){

  let pair_array = []; //pairs of indices
  let seen_hash = {}; 
  // [3,3,3,-3,-3,-3,-3,4]
  // output: [[0,3],[1,3],[2,3],[0,4],[]]
  for(let i = 0; i < this.length; i++){
    for(let j = 0; j < this.length; j++){
      if(i < j && this[i] + this[j] == 0){
        pair_array.push([i,j]);
      }
    }
  }
  return pair_array;
}

Array.prototype.transpose = function(){
  let transposed = [];
  // nested loop -> column then row rather than row then column
  for(let i = 0; i < this[0].length; i++){
    let new_row = [];
    for(let j = 0; j < this.length; j++){
      new_row.push(this[j][i]);
    }
    transposed.push(new_row);
  }
  return transposed;
}