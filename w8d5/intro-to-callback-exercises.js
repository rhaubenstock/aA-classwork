class Clock {
    constructor() {
        // 1. Create a Date object.
        this.date = new Date();

        // 2. Store the hours, minutes, and seconds.
        this.hours = this.date.getHours();
        this.minutes = this.date.getMinutes();
        this.seconds = this.date.getSeconds();

        // 3. Call printTime.
        

        // 4. Schedule the tick at 1 second intervals.
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.
    }
}

const clock = new Clock();