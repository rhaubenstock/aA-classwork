import React from 'react'

class Tile extends React.Component {
    constructor(props){
      super(props);
      this.state = {};
      // have tile info through props.tile
      // we want to make a className based on tile ->
      // - bombed, flagged, explored

      // when clicked -> change the underlying Tile through updateGame
      // 
      this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e){
      e.preventDefault();
      this.props.updateGame(this.props.tile, e.altKey);
    }

    render() {
      //className for bombed, explored, flagged - 
      //generate that string based on Tile's properties
      // debugger
      let content = "";
      let status = "";
      if (this.props.tile.bombed && this.props.tile.explored) {
        status = "bombed"
        content = "☢"
      } else if (this.props.tile.explored) {
        status = "explored"
        content = this.props.tile.adjacentBombCount()
      } else if (this.props.tile.flagged) {
        status = "flagged"
        content = "⚑"
      }
      return (
        <div className={`${status} tile`} onClick={this.handleClick}>{content}</div>
      )
    }
  }

  export default Tile