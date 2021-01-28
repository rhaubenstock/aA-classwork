import React from 'react'
import Tile from './tile'

class Board extends React.Component {
    constructor(props){
      super(props);
      this.state = {};
      //board has access to updateGame via this.props.updateGame
    }
    render() {
        const grid = this.props.board.grid.map((row, rowIdx) => {
            const rowHTML = row.map((tile, colIdx)=> {
              return <Tile key={rowIdx*this.props.board.gridSize + colIdx} 
                                updateGame={this.props.updateGame} 
                                tile={tile} 
                                pos={[rowIdx,colIdx]}/>;
            })
            return <div className="row" key={rowIdx}>{rowHTML}</div>
        });
      return (
        <div>
            {grid}
        </div>
      )
    }
  }

  export default Board