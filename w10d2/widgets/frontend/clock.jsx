import React from 'react';

class Clock extends React.Component{
  constructor(props){
    super(props); //need to put this if you are using this

    this.state = { time: new Date() };
    this.tick = this.tick.bind(this);
  }

  tick(){
    this.setState({ time: new Date() });
  }

  componentDidMount(){
    this.interval = setInterval(this.tick, 1000);
  }
  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render(){
    return (      // toString(this.state.time)
      <>
      <h1 className="clock">
        Clock
        <p>{this.state.time.toLocaleString()}</p>
      </h1>
      </>
    )
  }
}

export default Clock;