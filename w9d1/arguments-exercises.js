//Write a sum function that takes any number of arguments:
// Solve it first using the arguments keyword, 
// then rewrite your solution to use the ... rest operator.

function sum(){
  let sum = 0;
  // Array.from(arguments).forEach ( el => { 
  //   sum += el;
  // })
  [...arguments].forEach ( el => { 
    sum += el;
  })
  return sum;
}

function sum(...args){
  let sum = 0;
  args.forEach(el => { 
    sum += el;
  })
  return sum;
}


// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);


Function.prototype.myBind = function(ctx, ...args){
  let that = this;
  let returnFunc = function (...otherArgs){
    return that.apply(ctx, args.concat(otherArgs));
  }
  return returnFunc;
}

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// console.log(markov.says("meow", "Ned"));
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// console.log(markov.says.myBind(pavlov, "meow", "Kush")());
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// console.log(markov.says.myBind(pavlov)("meow", "a tree"));
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// console.log(markov.says.myBind(pavlov, "meow")("Markov"));
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// console.log(notMarkovSays("meow", "me"));
// // Pavlov says meow to me!
// // true

function curriedSum(numArgs) {
  let numbers = [];
  const _curriedSum = function(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let total = 0;
      numbers.forEach(ele => total += ele)
      return total;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// const sum1 = curriedSum(4);
// console.log(sum1(5)(30)(20)(1)); 


Function.prototype.curry = function(numArgs) {
  let args = []; // 5, 30.. 
  let that = this;
  const _curry = function(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      // let total = 0;
      // args.forEach(ele => total += ele)
      // return total;
      return that.apply(that, args);
    } else {
      return _curry;
    }
  }
  return _curry;
}


// const sum2 = sum.curry(5);
// console.log(sum2(5)(30)(20)(1));