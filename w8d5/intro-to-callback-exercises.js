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

const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});
// if you want to add 5 numbers
// addNumbers(0, 5, ()=>{console.log("done")})
function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft > 0){
    reader.question("Please enter a number: ", function (num){
        sum += parseInt(num);
        console.log(sum);
        addNumbers(sum, numsLeft - 1, completionCallback);
      }
    )
  }
  if (numsLeft === 0){
    completionCallback(sum);
    reader.close();
  }
}



// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
// console.log("end of stack");

