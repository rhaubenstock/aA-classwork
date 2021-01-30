import React from 'react';

function uniqueId() {
  return new Date().getTime();
}

class TodoForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {title: "", body: "", done: false, id: uniqueId()};
    this.resetForm = this.resetForm.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateDone = this.updateDone.bind(this);
  }

  resetForm(){
    this.setState({title: "", body: "", done: false, id: uniqueId()})
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.dispatchReceiveTodo(this.state);
    //afterwards -> new id so that old one doesn't get overwritten
    this.resetForm();
  }

  updateTitle(e){
    this.setState({title: e.target.value})
  }

  updateBody(e){
    this.setState({body: e.target.value})
  } 

  updateDone(e){
    this.setState({done: e.target.value})
  }

  render(){
    return(
      <form onSubmit={this.handleSubmit}>
        
        <h1>Add Todo</h1>

        <label>Title
          <input type="text" value={this.state.title} onChange={this.updateTitle}/>
        </label>
        <br />
        <label>Body
          <input type="text" value={this.state.body} onChange={this.updateBody} />
        </label>
        <br />
        <label>Done
          <input type="radio" value={true} name="done" onChange={this.updateDone} checked={this.state.done}/> True
          <input type="radio" value={false} name="done" onChange={this.updateDone} checked={!this.state.done} /> False
        </label>
        <button type="submit">Create Todo</button>
      </form>
    );
  }
}

export default TodoForm;