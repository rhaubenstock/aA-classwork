import React from 'react';
import TabItem from './tab_item';

class Tabs extends React.Component{
  constructor(props){
    super(props);
    this.props = props;
    this.state = { component: 0 };
    this.updateState = this.updateState.bind(this);
  }
  
  updateState(idx){
    this.setState({ component: idx });
  }


  render(){
    
    const tabHeaders = this.props.tabInfoArr.map( (tab, idx) => {
      return(
        <TabItem title={tab.title} key={idx} updateState={()=>this.updateState(idx)} isBold={idx === this.state.component}/>
      )
    })
    
    return (
      <>
        <h1>Tabs</h1>
        <ul>
          {tabHeaders}
        </ul>
        <article>
          {this.props.tabInfoArr[this.state.component].content}
        </article>
      </>
    )
  }
}

export default Tabs;