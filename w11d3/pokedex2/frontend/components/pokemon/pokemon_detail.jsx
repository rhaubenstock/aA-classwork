import React from 'react';

class PokemonDetail extends React.Component{
  componentDidMount() {
      this.props.requestSinglePokemon(this.props.match.params.pokeId)
  }

  render(){
      let pokename = "unknown"
      if (this.props.pokemon !== undefined) {
        pokename = this.props.pokemon.name
      }
        return (

        <div>
            {pokename}
        </div>
        )
  }
};

export default PokemonDetail;