function range(start, end){
  if(start > end){
    return [];
  } else { 
    return [start].concat(range(start+1, end))
  }
}

function sumRec(arr) {
  if (arr.length === 0 ){
    return 0;
  } else {
    return arr[0] + sumRec(arr.slice(1))
  }
}

function exponent_a(base, exp){
  if (exp === 0){
    return 1;
  }else {
    return base * exponent_a(base, exp-1);
  }
}

function exponent_b(base, exp){
  if (exp === 0 ){
    return 1;
  } else if (exp%2 === 0) {
    let root = exponent_b(base, exp/2);
    return root * root; 
  } else {
    let root = exponent_b(base, (exp-1)/2);
    return base * root * root;
  }
}

function fibonacci(n) {
  if (n === 0){
    return [0];
  }
  else if(n === 1){
    return [0,1];
  }
  else {
    let n_1 = fibonacci(n-1); // [0,1,1,2]
    return n_1.concat([n_1[n_1.length-1] + n_1[n_1.length-2]]); // [0,1,1,2,3]
  }
}

function deepDup(arr) {
  // return arr.map( el => {return typeof(el) === 'object' ? deepDup(el) : el} );
  return arr.map( el => {return el instanceof Array ? deepDup(el) : el} );
}

/**
 * def deep_dup(arr)
 *  arr.map {|el|  el.is_a?(Array) ? deep_dup(el) : el}
 * end
 */