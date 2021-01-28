import * as Minesweeper from "./../frontend/minesweeper"
import React from 'react'
import Board from './board'

const BOARDSIZE = 9;
const NUMBOMBS = Math.trunc(BOARDSIZE**2/3);

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {
                    board: new Minesweeper.Board(BOARDSIZE, NUMBOMBS),
                 };
    this.updateGame = this.updateGame.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  updateGame(tile, flagged) {
    if(flagged){
      tile.toggleFlag();
    }
    else {
      tile.explore();
    }
    this.setState({ board: this.state.board });
    // if(this.state.board.won()){
    //   window.alert("you win!")
    // }
    // else if(this.state.board.lost()){
    //   window.alert("better luck next time!")
    //   this.setState({ board: new Minesweeper.Board(BOARDSIZE, NUMBOMBS)});
    // }
  }

  
  reset(){
    this.setState({board: new Minesweeper.Board(BOARDSIZE, NUMBOMBS)})
  }
  
  handleClick(e){
    e.preventDefault();
    this.reset()
  }
  render() {
    let modal = "";
    if(this.state.board.won()){
      //window.alert("you win!")
      modal = "won" 
    }
    else if(this.state.board.lost()){
      // window.alert("better luck next time!")
      modal = "lost"
    }
    return (
      <>
        <div className="board">
          <Board board={this.state.board} updateGame={this.updateGame}/>
        </div>
        <div className={`${modal === "" ? "" : "is-open"} modal` }>
          <section className="modal-screen">
          </section>
          <div className="modal-message">{modal}
            <button onClick={this.handleClick}>Reset Game</button>
          </div>
        </div>
      </>
    )
  }
}

export default Game