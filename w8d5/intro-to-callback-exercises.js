class Clock {
    constructor() {
        // 1. Create a Date object.
        this.date = new Date();

        // 2. Store the hours, minutes, and seconds.
        this.hours = this.date.getHours();
        this.minutes = this.date.getMinutes();
        this.seconds = this.date.getSeconds();

        // 3. Call printTime.
        this.printTime();


        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        let hourString = String(this.hours);
        if(hourString.length < 2){
          hourString = '0' + hourString;
        }
        let minuteString = String(this.minutes);
        if(minuteString.length < 2){
          minuteString = '0' + minuteString;
        }
        let secondString = String(this.seconds);
        if(secondString.length < 2){
          secondString = '0' + secondString;
        }
        let timeStr = [hourString, minuteString, secondString].join(":");

        console.log(timeStr);
        // Format the time in HH:MM:SS
        // Use console.log to print it.
    }

    _tick() {
        // 1. Increment the time by one second.
        this.seconds += 1;
        if (this.seconds === 60){
          this.minutes += 1;
          this.seconds = 0;
        }
        if (this.minutes === 60){
          this.hours += 1;
          this.minutes = 0;
        }
        if (this.hours === 24){
          this.hours = 0;
        }

        // 2. Call printTime.
        // console.log(this);
        this.printTime();
    }
}

// const clock = new Clock();

// const readline = require('readline');

// const reader = readline.createInterface({
//   // it's okay if this part is magic; it just says that we want to
//   // 1. output the prompt to the standard output (console)
//   // 2. read input from the standard input (again, console)

//   input: process.stdin,
//   output: process.stdout
// });
// // if you want to add 5 numbers
// // addNumbers(0, 5, ()=>{console.log("done")})
// function addNumbers(sum, numsLeft, completionCallback){
//   if (numsLeft > 0){
//     reader.question("Please enter a number: ", function (num){
//         sum += parseInt(num);
//         console.log(sum);
//         addNumbers(sum, numsLeft - 1, completionCallback);
//       }
//     )
//   }
//   if (numsLeft === 0){
//     completionCallback(sum);
//     reader.close();
//   }
// }



// // addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
// // console.log("end of stack");


//absurdBubbleSort

// const readline = require("readline");

// const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
// });

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
    // Prompt user to tell us whether el1 > el2; pass true back to the

    // callback if true; else false.
    reader.question(`Is ${el1} greater than ${el2} ?(y/n)`,
                        function(response){
                            callback(response === "y");
                        });
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
    //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
    //    continue the inner loop. You'll want to increment i for the
    //    next call, and possibly switch madeAnySwaps if you did swap.

    if (i === arr.length -1){
        outerBubbleSortLoop(madeAnySwaps);
    
    }else{
        askIfGreaterThan(arr[i], arr[i + 1], 
            function(boolean){
                if (boolean) {
                    [arr[i],arr[i+1]] = [arr[i+1],arr[i]];
                    madeAnySwaps = true;
                }

                innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
            }
        );
    }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        // Begin an inner loop if you made any swaps. Otherwise, call
        // `sortCompletionCallback`.
        if (madeAnySwaps){
          innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        }
        else{
          sortCompletionCallback(arr);
        }
    }

    // Kick the first outer loop off, starting `madeAnySwaps` as true.
    outerBubbleSortLoop(true);
}

// absurdBubbleSort(["cat", "dog", "horse"], function (arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     reader.close();
// });

// askIfGreaterThan(5,7,function(boolean){console.log(boolean)})
// innerBubbleSortLoop([4,3,10,1], 1, true, function(boolean){console.log(`finished with return value: ${boolean}`)});



Function.prototype.myBind = function(context){
  return () => {
    this.call(context);
  };
}



// class Lamp {
//   constructor() {
//     this.name = "a lamp";
//   }
// }

// const turnOn = function() {
//   console.log("Turning on " + this.name);
// };

// const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"

Function.prototype.myThrottle = function(interval){
  let tooSoon = false;
  return function(){
    if (!tooSoon){
      tooSoon = true;
      setTimeout(function(){tooSoon = false;}, interval);
      //this -> function itself
      this(...arguments);
    }
  }.bind(this);
}


// class Neuron {
//   fire() {
//     console.log("Firing!");
//   }
// }

// const neuron = new Neuron();
// When we create a new Neuron,
// we can call #fire as frequently as we want

// The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval = setInterval(() => {
//   neuron.fire();
// }, 10);

// // You can use clearInterval to stop the firing:
// clearInterval(interval);

// // Using Function#myThrottle, we should be able to throttle
// // the #fire function of our neuron so that it can only fire
// // once every 500ms:

// neuron.fire = neuron.fire.myThrottle(500);

// const interval = setInterval(() => {
//   neuron.fire();
// }, 10);

// // This time, if our Function#myThrottle worked correctly,
// // the Neuron#fire function should only be able to execute
// // every 500ms, even though we're still trying to invoke it
// // every 10ms!

// // If we want this behavior for ALL neurons, we can do the same logic in the constructor:

// class Neuron {
//   constructor() {
//     this.fire = this.fire.myThrottle(500);
//   }

//   fire() {
//     console.log("Firing!");
//   }
// }

Function.prototype.myDebounce = function(interval){
  let lastCalledTimeout = undefined;
  return function(){
    if(lastCalledTimeout){
      clearTimeout(lastCalledTimeout);
    }
    lastCalledTimeout = setTimeout(function(){
      this(...arguments);
    }.bind(this), interval);
  }.bind(this);
}

// function -> "hello"
// button -> 1s after you press the button-> "hello"


class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}


const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};

// queryForHelloWorld();

searchBar.search = searchBar.search.myDebounce(500);

queryForHelloWorld();